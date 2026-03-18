import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viral_recipes_app/features/submission/data/submission_models.dart';
import 'package:viral_recipes_app/features/submission/data/submission_repository.dart';
import 'package:viral_recipes_app/features/submission/data/submission_validator.dart';
import 'package:viral_recipes_app/features/submission/state/submission_state.dart';

final submissionControllerProvider =
    StateNotifierProvider.autoDispose<SubmissionController, SubmissionState>((ref) {
  final repository = ref.watch(submissionRepositoryProvider);
  final controller = SubmissionController(repository: repository);
  ref.onDispose(controller.dispose);
  return controller;
});

class SubmissionController extends StateNotifier<SubmissionState> {
  SubmissionController({required SubmissionRepository repository})
      : _repository = repository,
        super(const SubmissionState());

  final SubmissionRepository _repository;
  Timer? _pollTimer;

  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> submit(SubmissionRequestModel request) async {
    final error = SubmissionValidator.validateUrl(request.url);
    if (error != null) {
      state = state.copyWith(currentFieldError: error);
      return;
    }

    state = state.copyWith(submitting: true, currentFieldError: null, errorMessage: null);
    final submission = await _repository.submit(request);
    state = state.copyWith(
      submitting: false,
      pending: [...state.pending, submission],
    );
    _startPolling();
  }

  void dismissError() {
    state = state.copyWith(errorMessage: null);
  }

  void _startPolling() {
    _pollTimer ??= Timer.periodic(const Duration(seconds: 15), (_) => _pollPending());
  }

  Future<void> _pollPending() async {
    final futures = state.pending.map((submission) async {
      if (submission.status == SubmissionStatus.published ||
          submission.status == SubmissionStatus.failed) {
        return submission;
      }
      final updated = await _repository.pollStatus(submission.id);
      return submission.copyWith(
        status: updated.status,
        updatedAt: updated.updatedAt,
        estimatedCompletionMinutes: updated.estimatedCompletionMinutes,
        failureReason: updated.failureReason,
      );
    }).toList();

    final results = await Future.wait(futures);
    state = state.copyWith(pending: results);

    final stillPending = results.any((submission) =>
        submission.status == SubmissionStatus.pending ||
        submission.status == SubmissionStatus.processing);
    if (!stillPending) {
      _pollTimer?.cancel();
      _pollTimer = null;
    }
  }

}
