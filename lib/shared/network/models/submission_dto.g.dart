// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmissionDtoImpl _$$SubmissionDtoImplFromJson(Map<String, dynamic> json) =>
    _$SubmissionDtoImpl(
      id: json['id'] as String,
      videoUrl: json['videoUrl'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      estimatedCompletionMinutes:
          (json['estimatedCompletionMinutes'] as num?)?.toInt(),
      failureReason: json['failureReason'] as String?,
    );

Map<String, dynamic> _$$SubmissionDtoImplToJson(_$SubmissionDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'videoUrl': instance.videoUrl,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'estimatedCompletionMinutes': instance.estimatedCompletionMinutes,
      'failureReason': instance.failureReason,
    };
