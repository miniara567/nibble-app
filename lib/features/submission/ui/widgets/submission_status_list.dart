import 'package:flutter/material.dart';
import 'package:viral_recipes_app/features/submission/data/submission_models.dart';

class SubmissionStatusList extends StatelessWidget {
  const SubmissionStatusList({super.key, required this.submissions});

  final List<SubmissionModel> submissions;

  @override
  Widget build(BuildContext context) {
    if (submissions.isEmpty) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text('Recent submissions', style: theme.textTheme.titleMedium),
          ),
          for (final submission in submissions)
            ListTile(
              leading: Icon(_icon(submission.status), color: _color(theme, submission.status)),
              title: Text(submission.url, maxLines: 1, overflow: TextOverflow.ellipsis),
              subtitle: Text(_statusLabel(submission)),
              trailing: Text(
                submission.updatedAt.toLocal().toIso8601String().substring(11, 19),
                style: theme.textTheme.bodySmall,
              ),
            ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  IconData _icon(SubmissionStatus status) {
    return switch (status) {
      SubmissionStatus.published => Icons.check_circle,
      SubmissionStatus.failed => Icons.error_outline,
      SubmissionStatus.processing => Icons.timelapse,
      SubmissionStatus.pending => Icons.hourglass_bottom,
    };
  }

  Color _color(ThemeData theme, SubmissionStatus status) {
    return switch (status) {
      SubmissionStatus.published => theme.colorScheme.primary,
      SubmissionStatus.failed => theme.colorScheme.error,
      SubmissionStatus.processing => theme.colorScheme.tertiary,
      SubmissionStatus.pending => theme.colorScheme.outline,
    };
  }

  String _statusLabel(SubmissionModel submission) {
    return switch (submission.status) {
      SubmissionStatus.published => 'Published! Recipe ready in feed.',
      SubmissionStatus.failed =>
          'Failed: ${submission.failureReason ?? 'tap to retry later'}',
      SubmissionStatus.processing =>
          'Processing… about ${submission.estimatedCompletionMinutes ?? 10} minutes remaining.',
      SubmissionStatus.pending => 'Queued. We will start soon.',
    };
  }
}
