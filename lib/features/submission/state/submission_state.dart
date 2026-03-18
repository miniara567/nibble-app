import 'package:equatable/equatable.dart';
import 'package:viral_recipes_app/features/submission/data/submission_models.dart';

class SubmissionState extends Equatable {
  const SubmissionState({
    this.pending = const [],
    this.submitting = false,
    this.errorMessage,
    this.currentFieldError,
  });

  final List<SubmissionModel> pending;
  final bool submitting;
  final String? errorMessage;
  final String? currentFieldError;

  SubmissionState copyWith({
    List<SubmissionModel>? pending,
    bool? submitting,
    String? errorMessage,
    String? currentFieldError,
  }) {
    return SubmissionState(
      pending: pending ?? this.pending,
      submitting: submitting ?? this.submitting,
      errorMessage: errorMessage,
      currentFieldError: currentFieldError,
    );
  }

  @override
  List<Object?> get props => [pending, submitting, errorMessage, currentFieldError];
}
