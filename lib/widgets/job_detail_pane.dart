import 'package:flutter/material.dart';
import '../models/job.dart';
import '../theme/app_theme.dart';
import 'sdg_badge.dart';

class JobDetailPane extends StatelessWidget {
  final Job job;
  final bool isSaved;
  final VoidCallback onToggleSave;
  final bool isScrollable;

  const JobDetailPane({
    super.key,
    required this.job,
    required this.isSaved,
    required this.onToggleSave,
    this.isScrollable = true,
  });

  void _showApplyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: AppTheme.warmSurface,
          titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.leafTint,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.open_in_new_rounded,
                  color: AppTheme.primaryGreen,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Text(
                  'Continue with Employer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textHigh,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You are applying for ${job.title} at ${job.organization}.',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryGreen,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Goodwork operates as an open-access directory connecting impact professionals with verified mission-driven teams. This application continues directly on the employer\'s portal.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.textMedium,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceMuted,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.warmBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Employer Application Channel:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textMuted,
                      ),
                    ),
                    const SizedBox(height: 4),
                    SelectableText(
                      job.applyUrl,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.primaryGreenLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined, size: 14, color: AppTheme.textMuted),
                        const SizedBox(width: 6),
                        SelectableText(
                          job.contactEmail,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.textMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(color: AppTheme.textMedium),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppTheme.primaryGreen,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    content: Row(
                      children: [
                        const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Application link copied for ${job.organization}!',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    duration: const Duration(seconds: 4),
                  ),
                );
              },
              child: const Text('Proceed to Apply'),
            ),
          ],
        );
      },
    );
  }

  void _shareJob(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppTheme.primaryGreenLight,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text('Job link for "${job.title}" copied to clipboard!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Organization header banner
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppTheme.leafTint,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppTheme.leafBorder, width: 1.5),
              ),
              alignment: Alignment.center,
              child: Text(
                job.organization.isNotEmpty ? job.organization[0].toUpperCase() : 'G',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primaryGreen,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.organization,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textMedium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    job.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textHigh,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Posted ${job.postedDate} • ${job.category.displayName}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppTheme.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            // Actions: Save & Share
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Tooltip(
                  message: 'Share this listing',
                  child: IconButton(
                    icon: const Icon(Icons.share_outlined),
                    color: AppTheme.textMedium,
                    onPressed: () => _shareJob(context),
                  ),
                ),
                Tooltip(
                  message: isSaved ? 'Remove from saved' : 'Save job for later',
                  child: IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                      color: isSaved ? AppTheme.amberHighlight : AppTheme.textMedium,
                    ),
                    onPressed: onToggleSave,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Key stats grid (Location, Type, Salary, Workplace)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surfaceMuted,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppTheme.warmBorder),
          ),
          child: Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              _metricItem(Icons.location_on_outlined, 'Location', job.location),
              _metricItem(Icons.work_outline_rounded, 'Employment', job.employmentType),
              _metricItem(Icons.home_work_outlined, 'Workplace', job.workplaceType),
              if (job.salary != null)
                _metricItem(
                  Icons.payments_outlined,
                  'Compensation',
                  job.salary!,
                  highlight: true,
                ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Impact Statement Box (Highlight)
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryGreen.withValues(alpha: 0.08),
                AppTheme.leafTint.withValues(alpha: 0.4),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppTheme.leafBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.public, color: AppTheme.primaryGreen, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'IMPACT MISSION',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.primaryGreen,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '“${job.impactStatement}”',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryGreen,
                  height: 1.45,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // UN Sustainable Development Goals Alignment
        const Text(
          'UN Sustainable Development Goals (SDGs)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.textHigh,
          ),
        ),
        const SizedBox(height: 10),
        ...job.sdgs.map((sdg) => SdgBadge(sdg: sdg, compact: false)),

        const SizedBox(height: 24),

        // Role Description
        const Text(
          'Role Overview',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppTheme.textHigh,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          job.description,
          style: const TextStyle(
            fontSize: 15,
            color: AppTheme.textMedium,
            height: 1.6,
          ),
        ),

        if (job.responsibilities.isNotEmpty) ...[
          const SizedBox(height: 24),
          const Text(
            'Key Responsibilities',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textHigh,
            ),
          ),
          const SizedBox(height: 12),
          ...job.responsibilities.map(
            (resp) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6, right: 10),
                    child: Icon(Icons.circle, size: 6, color: AppTheme.forestAccent),
                  ),
                  Expanded(
                    child: Text(
                      resp,
                      style: const TextStyle(
                        fontSize: 14.5,
                        color: AppTheme.textMedium,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

        if (job.requirements.isNotEmpty) ...[
          const SizedBox(height: 24),
          const Text(
            'Candidate Profile & Requirements',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textHigh,
            ),
          ),
          const SizedBox(height: 12),
          ...job.requirements.map(
            (req) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6, right: 10),
                    child: Icon(Icons.check_rounded, size: 16, color: AppTheme.primaryGreen),
                  ),
                  Expanded(
                    child: Text(
                      req,
                      style: const TextStyle(
                        fontSize: 14.5,
                        color: AppTheme.textMedium,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

        if (job.skills.isNotEmpty) ...[
          const SizedBox(height: 24),
          const Text(
            'Relevant Skills & Focus Areas',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textHigh,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: job.skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: AppTheme.leafTint,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.leafBorder),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primaryGreen,
                  ),
                ),
              );
            }).toList(),
          ),
        ],

        const SizedBox(height: 32),

        // Apply Button section
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.leafTint.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.leafBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Ready to create meaningful impact?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryGreen,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Submit your application directly through the employer portal.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.textMedium,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _showApplyDialog(context),
                icon: const Icon(Icons.send_rounded, size: 18),
                label: const Text('Apply for this role'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 40),
      ],
    );

    if (isScrollable) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: content,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: content,
    );
  }

  Widget _metricItem(
    IconData icon,
    String label,
    String value, {
    bool highlight = false,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 18,
          color: highlight ? AppTheme.amberHighlight : AppTheme.textMuted,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppTheme.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: highlight ? FontWeight.w700 : FontWeight.w600,
                color: highlight ? const Color(0xFF875200) : AppTheme.textHigh,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
