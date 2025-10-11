// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubmissionDto _$SubmissionDtoFromJson(Map<String, dynamic> json) {
  return _SubmissionDto.fromJson(json);
}

/// @nodoc
mixin _$SubmissionDto {
  String get id => throw _privateConstructorUsedError;
  String get videoUrl => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int? get estimatedCompletionMinutes => throw _privateConstructorUsedError;
  String? get failureReason => throw _privateConstructorUsedError;

  /// Serializes this SubmissionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmissionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmissionDtoCopyWith<SubmissionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmissionDtoCopyWith<$Res> {
  factory $SubmissionDtoCopyWith(
          SubmissionDto value, $Res Function(SubmissionDto) then) =
      _$SubmissionDtoCopyWithImpl<$Res, SubmissionDto>;
  @useResult
  $Res call(
      {String id,
      String videoUrl,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      int? estimatedCompletionMinutes,
      String? failureReason});
}

/// @nodoc
class _$SubmissionDtoCopyWithImpl<$Res, $Val extends SubmissionDto>
    implements $SubmissionDtoCopyWith<$Res> {
  _$SubmissionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmissionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? videoUrl = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? estimatedCompletionMinutes = freezed,
    Object? failureReason = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedCompletionMinutes: freezed == estimatedCompletionMinutes
          ? _value.estimatedCompletionMinutes
          : estimatedCompletionMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmissionDtoImplCopyWith<$Res>
    implements $SubmissionDtoCopyWith<$Res> {
  factory _$$SubmissionDtoImplCopyWith(
          _$SubmissionDtoImpl value, $Res Function(_$SubmissionDtoImpl) then) =
      __$$SubmissionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String videoUrl,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      int? estimatedCompletionMinutes,
      String? failureReason});
}

/// @nodoc
class __$$SubmissionDtoImplCopyWithImpl<$Res>
    extends _$SubmissionDtoCopyWithImpl<$Res, _$SubmissionDtoImpl>
    implements _$$SubmissionDtoImplCopyWith<$Res> {
  __$$SubmissionDtoImplCopyWithImpl(
      _$SubmissionDtoImpl _value, $Res Function(_$SubmissionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmissionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? videoUrl = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? estimatedCompletionMinutes = freezed,
    Object? failureReason = freezed,
  }) {
    return _then(_$SubmissionDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedCompletionMinutes: freezed == estimatedCompletionMinutes
          ? _value.estimatedCompletionMinutes
          : estimatedCompletionMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      failureReason: freezed == failureReason
          ? _value.failureReason
          : failureReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmissionDtoImpl implements _SubmissionDto {
  const _$SubmissionDtoImpl(
      {required this.id,
      required this.videoUrl,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      this.estimatedCompletionMinutes,
      this.failureReason});

  factory _$SubmissionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmissionDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String videoUrl;
  @override
  final String status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int? estimatedCompletionMinutes;
  @override
  final String? failureReason;

  @override
  String toString() {
    return 'SubmissionDto(id: $id, videoUrl: $videoUrl, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, estimatedCompletionMinutes: $estimatedCompletionMinutes, failureReason: $failureReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.estimatedCompletionMinutes,
                    estimatedCompletionMinutes) ||
                other.estimatedCompletionMinutes ==
                    estimatedCompletionMinutes) &&
            (identical(other.failureReason, failureReason) ||
                other.failureReason == failureReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, videoUrl, status, createdAt,
      updatedAt, estimatedCompletionMinutes, failureReason);

  /// Create a copy of SubmissionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionDtoImplCopyWith<_$SubmissionDtoImpl> get copyWith =>
      __$$SubmissionDtoImplCopyWithImpl<_$SubmissionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmissionDtoImplToJson(
      this,
    );
  }
}

abstract class _SubmissionDto implements SubmissionDto {
  const factory _SubmissionDto(
      {required final String id,
      required final String videoUrl,
      required final String status,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int? estimatedCompletionMinutes,
      final String? failureReason}) = _$SubmissionDtoImpl;

  factory _SubmissionDto.fromJson(Map<String, dynamic> json) =
      _$SubmissionDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get videoUrl;
  @override
  String get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int? get estimatedCompletionMinutes;
  @override
  String? get failureReason;

  /// Create a copy of SubmissionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmissionDtoImplCopyWith<_$SubmissionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
