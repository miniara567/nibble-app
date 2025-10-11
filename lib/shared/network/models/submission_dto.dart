import 'package:freezed_annotation/freezed_annotation.dart';

part 'submission_dto.freezed.dart';
part 'submission_dto.g.dart';

@freezed
class SubmissionDto with _$SubmissionDto {
  const factory SubmissionDto({
    required String id,
    required String videoUrl,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? estimatedCompletionMinutes,
    String? failureReason,
  }) = _SubmissionDto;

  factory SubmissionDto.fromJson(Map<String, dynamic> json) =>
      _$SubmissionDtoFromJson(json);
}
