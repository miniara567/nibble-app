import 'package:equatable/equatable.dart';

enum SubmissionStatus { pending, processing, published, failed }

class SubmissionRequestModel extends Equatable {
  const SubmissionRequestModel({
    required this.url,
    this.contactEmail,
    this.notes,
  });

  final String url;
  final String? contactEmail;
  final String? notes;

  @override
  List<Object?> get props => [url, contactEmail, notes];
}

class SubmissionModel extends Equatable {
  const SubmissionModel({
    required this.id,
    required this.url,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.estimatedCompletionMinutes,
    this.failureReason,
  });

  final String id;
  final String url;
  final SubmissionStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? estimatedCompletionMinutes;
  final String? failureReason;

  SubmissionModel copyWith({
    SubmissionStatus? status,
    DateTime? updatedAt,
    int? estimatedCompletionMinutes,
    String? failureReason,
  }) {
    return SubmissionModel(
      id: id,
      url: url,
      status: status ?? this.status,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      estimatedCompletionMinutes:
          estimatedCompletionMinutes ?? this.estimatedCompletionMinutes,
      failureReason: failureReason ?? this.failureReason,
    );
  }

  @override
  List<Object?> get props => [
        id,
        url,
        status,
        createdAt,
        updatedAt,
        estimatedCompletionMinutes,
        failureReason,
      ];
}
