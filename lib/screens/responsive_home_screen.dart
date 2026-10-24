import 'package:flutter/material.dart';
import '../data/sample_jobs.dart';
import '../models/job.dart';
import '../theme/app_theme.dart';
import '../widgets/empty_state.dart';
import '../widgets/job_card.dart';
import '../widgets/job_detail_pane.dart';
import '../widgets/search_and_filters.dart';
import 'job_detail_screen.dart';

class ResponsiveHomeScreen extends StatefulWidget {
  const ResponsiveHomeScreen({super.key});

  @override
  State<ResponsiveHomeScreen> createState() => _ResponsiveHomeScreenState();
}

class _ResponsiveHomeScreenState extends State<ResponsiveHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _savedJobIds = {'job-1', 'job-5'}; // Start with 2 saved as a nice preview

  JobCategory _selectedCategory = JobCategory.all;
  String _searchQuery = '';
  bool _showSavedOnly = false;
  String? _selectedJobId;

  static const double kTwoPaneBreakpoint = 900.0;

  @override
  void initState() {
    super.initState();
    // Default select first job for two-pane desktop views
    if (SampleJobs.jobs.isNotEmpty) {
      _selectedJobId = SampleJobs.jobs.first.id;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Job> get _filteredJobs {
    return SampleJobs.jobs.where((job) {
      // Category filter
      if (_selectedCategory != JobCategory.all && job.category != _selectedCategory) {
        return false;
      }
      // Saved filter
      if (_showSavedOnly && !_savedJobIds.contains(job.id)) {
        return false;
      }
      // Search query filter (matches title, org, loc, category, skills, SDGs, etc.)
      if (_searchQuery.isNotEmpty && !job.matchesQuery(_searchQuery)) {
        return false;
      }
      return true;
    }).toList();
  }

  void _toggleSaveJob(String jobId) {
    setState(() {
      if (_savedJobIds.contains(jobId)) {
        _savedJobIds.remove(jobId);
      } else {
        _savedJobIds.add(jobId);
      }
    });
  }

  void _selectJob(Job job, bool isWideScreen) {
    setState(() {
      _selectedJobId = job.id;
    });

    if (!isWideScreen) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => JobDetailScreen(
            job: job,
            isSaved: _savedJobIds.contains(job.id),
            onToggleSave: () {
              _toggleSaveJob(job.id);
              // Trigger redraw in detail screen
              setState(() {});
            },
          ),
        ),
      );
    }
  }

  void _resetFilters() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
      _selectedCategory = JobCategory.all;
      _showSavedOnly = false;
      if (SampleJobs.jobs.isNotEmpty) {
        _selectedJobId = SampleJobs.jobs.first.id;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth >= kTwoPaneBreakpoint;
        final filteredJobs = _filteredJobs;

        // Ensure selected job exists in current list if possible
        Job? selectedJob;
        if (_selectedJobId != null) {
          try {
            selectedJob = SampleJobs.jobs.firstWhere((j) => j.id == _selectedJobId);
          } catch (_) {
            selectedJob = filteredJobs.isNotEmpty ? filteredJobs.first : null;
          }
        } else if (filteredJobs.isNotEmpty) {
          selectedJob = filteredJobs.first;
        }

        return Scaffold(
          backgroundColor: AppTheme.warmOffWhite,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top App Header
                _buildHeader(context, isWideScreen),

                // Main body: phone single column vs tablet/desktop two-pane
                Expanded(
                  child: isWideScreen
                      ? _buildTwoPaneLayout(filteredJobs, selectedJob)
                      : _buildSinglePaneLayout(filteredJobs, isWideScreen: false),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isWideScreen) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWideScreen ? 32 : 20,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: AppTheme.warmOffWhite,
        border: Border(
          bottom: BorderSide(color: AppTheme.warmBorder, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo icon with leaf motif
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.primaryGreen, AppTheme.forestAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryGreen.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.spa_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          // Brand & tagline
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Goodwork',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.primaryGreen,
                    letterSpacing: -0.4,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  'Find work that matters.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.textMedium,
                  ),
                ),
              ],
            ),
          ),
          // Impact Badge pill
          if (isWideScreen)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.leafTint,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppTheme.leafBorder),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.public, color: AppTheme.primaryGreen, size: 16),
                  SizedBox(width: 6),
                  Text(
                    'UN SDG Aligned Careers',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Single Pane Layout (Phones / narrow screens)
  Widget _buildSinglePaneLayout(List<Job> jobs, {required bool isWideScreen}) {
    return Column(
      children: [
        // Search & Filters bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: SearchAndFilters(
            searchController: _searchController,
            onSearchChanged: (val) => setState(() => _searchQuery = val),
            onClearSearch: () => setState(() {
              _searchController.clear();
              _searchQuery = '';
            }),
            selectedCategory: _selectedCategory,
            onCategorySelected: (cat) => setState(() => _selectedCategory = cat),
            showSavedOnly: _showSavedOnly,
            savedCount: _savedJobIds.length,
            onToggleSavedFilter: () => setState(() => _showSavedOnly = !_showSavedOnly),
          ),
        ),

        // Count status line
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              Text(
                _showSavedOnly
                    ? 'Saved roles (${jobs.length})'
                    : '${jobs.length} impact ${jobs.length == 1 ? "role" : "roles"} available',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 4),

        // Scrollable list of jobs or empty state
        Expanded(
          child: jobs.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  physics: const BouncingScrollPhysics(),
                  itemCount: jobs.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return JobCard(
                      job: job,
                      isSelected: false,
                      isSaved: _savedJobIds.contains(job.id),
                      onTap: () => _selectJob(job, false),
                      onToggleSave: () => _toggleSaveJob(job.id),
                    );
                  },
                ),
        ),
      ],
    );
  }

  // Two Pane Layout (Tablets / Desktops >= 900px)
  Widget _buildTwoPaneLayout(List<Job> jobs, Job? selectedJob) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Pane: Search, Category Filters, and Job List
          SizedBox(
            width: 420,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SearchAndFilters(
                  searchController: _searchController,
                  onSearchChanged: (val) => setState(() => _searchQuery = val),
                  onClearSearch: () => setState(() {
                    _searchController.clear();
                    _searchQuery = '';
                  }),
                  selectedCategory: _selectedCategory,
                  onCategorySelected: (cat) => setState(() => _selectedCategory = cat),
                  showSavedOnly: _showSavedOnly,
                  savedCount: _savedJobIds.length,
                  onToggleSavedFilter: () => setState(() => _showSavedOnly = !_showSavedOnly),
                ),

                const SizedBox(height: 14),

                // Count line
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Text(
                        _showSavedOnly
                            ? 'Saved roles (${jobs.length})'
                            : '${jobs.length} impact ${jobs.length == 1 ? "role" : "roles"} available',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textMuted,
                        ),
                      ),
                      const Spacer(),
                      if (_searchQuery.isNotEmpty ||
                          _selectedCategory != JobCategory.all ||
                          _showSavedOnly)
                        TextButton(
                          onPressed: _resetFilters,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            minimumSize: const Size(40, 30),
                          ),
                          child: const Text(
                            'Reset filters',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.primaryGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Left pane scrollable job list
                Expanded(
                  child: jobs.isEmpty
                      ? _buildEmptyState()
                      : ListView.separated(
                          padding: const EdgeInsets.only(bottom: 24, right: 4),
                          physics: const BouncingScrollPhysics(),
                          itemCount: jobs.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final job = jobs[index];
                            final isSelected = selectedJob?.id == job.id;
                            return JobCard(
                              job: job,
                              isSelected: isSelected,
                              isSaved: _savedJobIds.contains(job.id),
                              onTap: () => _selectJob(job, true),
                              onToggleSave: () => _toggleSaveJob(job.id),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // Right Pane: Selected Job Details
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.warmSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.warmBorder, width: 1.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: selectedJob != null
                    ? JobDetailPane(
                        key: ValueKey<String>(selectedJob.id),
                        job: selectedJob,
                        isSaved: _savedJobIds.contains(selectedJob.id),
                        onToggleSave: () => _toggleSaveJob(selectedJob.id),
                        isScrollable: true,
                      )
                    : const Center(
                        child: EmptyState(
                          icon: Icons.touch_app_outlined,
                          title: 'No Job Selected',
                          message:
                              'Select a job from the list on the left to read the full mission, impact goals, and apply directly.',
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    if (_showSavedOnly) {
      return EmptyState(
        icon: Icons.bookmark_border_rounded,
        title: 'No Saved Roles Yet',
        message:
            'Tap the bookmark icon on any job card to save roles you want to revisit or apply for later.',
        actionLabel: 'Explore All Roles',
        onAction: () => setState(() => _showSavedOnly = false),
      );
    }

    return EmptyState(
      icon: Icons.search_off_rounded,
      title: 'No Matching Roles Found',
      message:
          'We couldn\'t find any jobs matching your current search or category filters. Try adjusting your query or resetting filters.',
      actionLabel: 'Reset Filters',
      onAction: _resetFilters,
    );
  }
}
