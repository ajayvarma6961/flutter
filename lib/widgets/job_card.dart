import 'package:flutter/material.dart';
import '../models/job.dart';
import '../theme/app_theme.dart';
import 'sdg_badge.dart';

class JobCard extends StatefulWidget {
  final Job job;
  final bool isSelected;
  final bool isSaved;
  final VoidCallback onTap;
  final VoidCallback onToggleSave;

  const JobCard({
    super.key,
    required this.job,
    required this.isSelected,
    required this.isSaved,
    required this.onTap,
    required this.onToggleSave,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final job = widget.job;
    final isSelected = widget.isSelected;
    final isSaved = widget.isSaved;

    final borderColor = isSelected
        ? AppTheme.primaryGreen
        : _isHovered
            ? AppTheme.primaryGreenLight.withValues(alpha: 0.5)
            : AppTheme.warmBorder;

    final backgroundColor = isSelected
        ? AppTheme.leafTint.withValues(alpha: 0.6)
        : _isHovered
            ? Colors.white
            : AppTheme.warmSurface;

    return Semantics(
      label: '${job.title} at ${job.organization}. Location: ${job.location}. ${job.employmentType}. ${job.salary ?? ""}. Impact: ${job.impactStatement}',
      button: true,
      selected: isSelected,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: borderColor,
              width: isSelected ? 2.0 : 1.0,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppTheme.primaryGreen.withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: widget.onTap,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top row: Organization name + Save bookmark button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Organization avatar placeholder
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppTheme.leafTint,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.leafBorder),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            job.organization.isNotEmpty
                                ? job.organization[0].toUpperCase()
                                : 'G',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primaryGreen,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Organization name & posted time
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                job.organization,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.textMedium,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                job.postedDate,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Save button with screen-reader and tooltip
                        Tooltip(
                          message: isSaved ? 'Remove from saved jobs' : 'Save job for later',
                          child: Semantics(
                            label: isSaved
                                ? 'Saved job. Double tap to remove from saved'
                                : 'Double tap to save job',
                            button: true,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(24),
                                onTap: widget.onToggleSave,
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  alignment: Alignment.center,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    transitionBuilder: (child, anim) =>
                                        ScaleTransition(scale: anim, child: child),
                                    child: Icon(
                                      isSaved
                                          ? Icons.bookmark_rounded
                                          : Icons.bookmark_border_rounded,
                                      key: ValueKey<bool>(isSaved),
                                      color: isSaved
                                          ? AppTheme.amberHighlight
                                          : AppTheme.textMuted,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Job Title
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textHigh,
                        height: 1.25,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Chips: Location, Workplace, Employment, Salary
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        _infoTag(Icons.location_on_outlined, job.location),
                        _infoTag(Icons.business_center_outlined, job.employmentType),
                        if (job.salary != null)
                          _infoTag(
                            Icons.currency_rupee,
                            job.salary!,
                            isHighlight: true,
                          ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Impact Statement snippet
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.leafTint.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.leafBorder.withValues(alpha: 0.6)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 2, right: 6),
                            child: Icon(
                              Icons.eco_rounded,
                              size: 15,
                              color: AppTheme.forestAccent,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              job.impactStatement,
                              style: const TextStyle(
                                fontSize: 12.5,
                                color: AppTheme.primaryGreenLight,
                                fontWeight: FontWeight.w500,
                                height: 1.35,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // SDG Badges & Category
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: job.sdgs
                                .take(2)
                                .map((sdg) => SdgBadge(sdg: sdg, compact: true))
                                .toList(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceMuted,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            job.category.displayName,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoTag(IconData icon, String text, {bool isHighlight = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isHighlight ? AppTheme.amberContainer : AppTheme.surfaceMuted,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 13,
            color: isHighlight ? AppTheme.amberHighlight : AppTheme.textMuted,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isHighlight ? FontWeight.w700 : FontWeight.w500,
              color: isHighlight ? const Color(0xFF875200) : AppTheme.textMedium,
            ),
          ),
        ],
      ),
    );
  }
}
