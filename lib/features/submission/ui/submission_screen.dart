import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viral_recipes_app/features/submission/data/submission_models.dart';
import 'package:viral_recipes_app/features/submission/state/submission_controller.dart';
import 'package:viral_recipes_app/features/submission/state/submission_state.dart';
import 'package:viral_recipes_app/features/submission/ui/widgets/submission_status_list.dart';
import 'package:viral_recipes_app/shared/design_system/tokens.dart';

class SubmissionScreen extends ConsumerStatefulWidget {
  const SubmissionScreen({super.key});

  static const routeName = 'submission';

  @override
  ConsumerState<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends ConsumerState<SubmissionScreen> {
  final _urlController = TextEditingController();
  final _emailController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    _emailController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(submissionControllerProvider);
    final controller = ref.read(submissionControllerProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final error = state.currentFieldError;
      if (error != null) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(SnackBar(content: Text(error)));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Submit Viral Recipe')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= AppBreakpoints.tablet;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isWide ? 720 : 520),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildForm(controller, state),
                    const SizedBox(height: AppSpacing.lg),
                    SubmissionStatusList(submissions: state.pending),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildForm(SubmissionController controller, SubmissionState state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Paste a link to a viral recipe video from TikTok, Instagram, Threads, or YouTube. '
              'We will extract the recipe and notify you when it is ready.',
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Video URL',
                hintText: 'https://www.tiktok.com/...',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Contact email (optional)',
                hintText: 'you@example.com',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes for the team (optional)',
                hintText: 'Anything we should know about timing, language, etc.',
              ),
              minLines: 2,
              maxLines: 4,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: state.submitting
                      ? null
                      : () {
                          controller.submit(
                            SubmissionRequestModel(
                              url: _urlController.text.trim(),
                              contactEmail: _emailController.text.trim().isEmpty
                                  ? null
                                  : _emailController.text.trim(),
                              notes: _notesController.text.trim().isEmpty
                                  ? null
                                  : _notesController.text.trim(),
                            ),
                          );
                        },
                  icon: state.submitting
                      ? const SizedBox.square(
                          dimension: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.send),
                  label: const Text('Submit'),
                ),
                const SizedBox(width: AppSpacing.sm),
                TextButton(
                  onPressed: () {
                    _urlController.clear();
                    _emailController.clear();
                    _notesController.clear();
                    controller.dismissError();
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
