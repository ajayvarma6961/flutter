import 'package:flutter/material.dart';
import '../models/job.dart';
import '../theme/app_theme.dart';
import '../widgets/job_detail_pane.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;
  final bool isSaved;
  final VoidCallback onToggleSave;

  const JobDetailScreen({
    super.key,
    required this.job,
    required this.isSaved,
    required this.onToggleSave,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.warmOffWhite,
      appBar: AppBar(
        title: Text(
          job.organization,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppTheme.primaryGreen,
          ),
        ),
        leading: Tooltip(
          message: 'Back to job list',
          child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          Tooltip(
            message: isSaved ? 'Remove from saved' : 'Save job',
            child: IconButton(
              icon: Icon(
                isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                color: isSaved ? AppTheme.amberHighlight : AppTheme.textMedium,
              ),
              onPressed: onToggleSave,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: JobDetailPane(
          job: job,
          isSaved: isSaved,
          onToggleSave: onToggleSave,
          isScrollable: true,
        ),
      ),
    );
  }
}
