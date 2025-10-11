// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeCollectionDto _$RecipeCollectionDtoFromJson(Map<String, dynamic> json) {
  return _RecipeCollectionDto.fromJson(json);
}

/// @nodoc
mixin _$RecipeCollectionDto {
  List<RecipeSummaryDto> get items => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;

  /// Serializes this RecipeCollectionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeCollectionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCollectionDtoCopyWith<RecipeCollectionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCollectionDtoCopyWith<$Res> {
  factory $RecipeCollectionDtoCopyWith(
          RecipeCollectionDto value, $Res Function(RecipeCollectionDto) then) =
      _$RecipeCollectionDtoCopyWithImpl<$Res, RecipeCollectionDto>;
  @useResult
  $Res call({List<RecipeSummaryDto> items, String? nextCursor});
}

/// @nodoc
class _$RecipeCollectionDtoCopyWithImpl<$Res, $Val extends RecipeCollectionDto>
    implements $RecipeCollectionDtoCopyWith<$Res> {
  _$RecipeCollectionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeCollectionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextCursor = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummaryDto>,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeCollectionDtoImplCopyWith<$Res>
    implements $RecipeCollectionDtoCopyWith<$Res> {
  factory _$$RecipeCollectionDtoImplCopyWith(_$RecipeCollectionDtoImpl value,
          $Res Function(_$RecipeCollectionDtoImpl) then) =
      __$$RecipeCollectionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecipeSummaryDto> items, String? nextCursor});
}

/// @nodoc
class __$$RecipeCollectionDtoImplCopyWithImpl<$Res>
    extends _$RecipeCollectionDtoCopyWithImpl<$Res, _$RecipeCollectionDtoImpl>
    implements _$$RecipeCollectionDtoImplCopyWith<$Res> {
  __$$RecipeCollectionDtoImplCopyWithImpl(_$RecipeCollectionDtoImpl _value,
      $Res Function(_$RecipeCollectionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeCollectionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextCursor = freezed,
  }) {
    return _then(_$RecipeCollectionDtoImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummaryDto>,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeCollectionDtoImpl implements _RecipeCollectionDto {
  const _$RecipeCollectionDtoImpl(
      {final List<RecipeSummaryDto> items = const <RecipeSummaryDto>[],
      this.nextCursor})
      : _items = items;

  factory _$RecipeCollectionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeCollectionDtoImplFromJson(json);

  final List<RecipeSummaryDto> _items;
  @override
  @JsonKey()
  List<RecipeSummaryDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? nextCursor;

  @override
  String toString() {
    return 'RecipeCollectionDto(items: $items, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeCollectionDtoImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), nextCursor);

  /// Create a copy of RecipeCollectionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeCollectionDtoImplCopyWith<_$RecipeCollectionDtoImpl> get copyWith =>
      __$$RecipeCollectionDtoImplCopyWithImpl<_$RecipeCollectionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeCollectionDtoImplToJson(
      this,
    );
  }
}

abstract class _RecipeCollectionDto implements RecipeCollectionDto {
  const factory _RecipeCollectionDto(
      {final List<RecipeSummaryDto> items,
      final String? nextCursor}) = _$RecipeCollectionDtoImpl;

  factory _RecipeCollectionDto.fromJson(Map<String, dynamic> json) =
      _$RecipeCollectionDtoImpl.fromJson;

  @override
  List<RecipeSummaryDto> get items;
  @override
  String? get nextCursor;

  /// Create a copy of RecipeCollectionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeCollectionDtoImplCopyWith<_$RecipeCollectionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeSummaryDto _$RecipeSummaryDtoFromJson(Map<String, dynamic> json) {
  return _RecipeSummaryDto.fromJson(json);
}

/// @nodoc
mixin _$RecipeSummaryDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get heroImageUrl => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;

  /// Serializes this RecipeSummaryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeSummaryDtoCopyWith<RecipeSummaryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeSummaryDtoCopyWith<$Res> {
  factory $RecipeSummaryDtoCopyWith(
          RecipeSummaryDto value, $Res Function(RecipeSummaryDto) then) =
      _$RecipeSummaryDtoCopyWithImpl<$Res, RecipeSummaryDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      String heroImageUrl,
      double confidence,
      String platform,
      List<String> tags,
      String? summary,
      int? durationSeconds,
      int? viewCount});
}

/// @nodoc
class _$RecipeSummaryDtoCopyWithImpl<$Res, $Val extends RecipeSummaryDto>
    implements $RecipeSummaryDtoCopyWith<$Res> {
  _$RecipeSummaryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? heroImageUrl = null,
    Object? confidence = null,
    Object? platform = null,
    Object? tags = null,
    Object? summary = freezed,
    Object? durationSeconds = freezed,
    Object? viewCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      heroImageUrl: null == heroImageUrl
          ? _value.heroImageUrl
          : heroImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeSummaryDtoImplCopyWith<$Res>
    implements $RecipeSummaryDtoCopyWith<$Res> {
  factory _$$RecipeSummaryDtoImplCopyWith(_$RecipeSummaryDtoImpl value,
          $Res Function(_$RecipeSummaryDtoImpl) then) =
      __$$RecipeSummaryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String heroImageUrl,
      double confidence,
      String platform,
      List<String> tags,
      String? summary,
      int? durationSeconds,
      int? viewCount});
}

/// @nodoc
class __$$RecipeSummaryDtoImplCopyWithImpl<$Res>
    extends _$RecipeSummaryDtoCopyWithImpl<$Res, _$RecipeSummaryDtoImpl>
    implements _$$RecipeSummaryDtoImplCopyWith<$Res> {
  __$$RecipeSummaryDtoImplCopyWithImpl(_$RecipeSummaryDtoImpl _value,
      $Res Function(_$RecipeSummaryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? heroImageUrl = null,
    Object? confidence = null,
    Object? platform = null,
    Object? tags = null,
    Object? summary = freezed,
    Object? durationSeconds = freezed,
    Object? viewCount = freezed,
  }) {
    return _then(_$RecipeSummaryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      heroImageUrl: null == heroImageUrl
          ? _value.heroImageUrl
          : heroImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeSummaryDtoImpl implements _RecipeSummaryDto {
  const _$RecipeSummaryDtoImpl(
      {required this.id,
      required this.title,
      required this.heroImageUrl,
      required this.confidence,
      required this.platform,
      final List<String> tags = const <String>[],
      this.summary,
      this.durationSeconds,
      this.viewCount})
      : _tags = tags;

  factory _$RecipeSummaryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeSummaryDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String heroImageUrl;
  @override
  final double confidence;
  @override
  final String platform;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? summary;
  @override
  final int? durationSeconds;
  @override
  final int? viewCount;

  @override
  String toString() {
    return 'RecipeSummaryDto(id: $id, title: $title, heroImageUrl: $heroImageUrl, confidence: $confidence, platform: $platform, tags: $tags, summary: $summary, durationSeconds: $durationSeconds, viewCount: $viewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeSummaryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.heroImageUrl, heroImageUrl) ||
                other.heroImageUrl == heroImageUrl) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      heroImageUrl,
      confidence,
      platform,
      const DeepCollectionEquality().hash(_tags),
      summary,
      durationSeconds,
      viewCount);

  /// Create a copy of RecipeSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeSummaryDtoImplCopyWith<_$RecipeSummaryDtoImpl> get copyWith =>
      __$$RecipeSummaryDtoImplCopyWithImpl<_$RecipeSummaryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeSummaryDtoImplToJson(
      this,
    );
  }
}

abstract class _RecipeSummaryDto implements RecipeSummaryDto {
  const factory _RecipeSummaryDto(
      {required final String id,
      required final String title,
      required final String heroImageUrl,
      required final double confidence,
      required final String platform,
      final List<String> tags,
      final String? summary,
      final int? durationSeconds,
      final int? viewCount}) = _$RecipeSummaryDtoImpl;

  factory _RecipeSummaryDto.fromJson(Map<String, dynamic> json) =
      _$RecipeSummaryDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get heroImageUrl;
  @override
  double get confidence;
  @override
  String get platform;
  @override
  List<String> get tags;
  @override
  String? get summary;
  @override
  int? get durationSeconds;
  @override
  int? get viewCount;

  /// Create a copy of RecipeSummaryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeSummaryDtoImplCopyWith<_$RecipeSummaryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeDto _$RecipeDtoFromJson(Map<String, dynamic> json) {
  return _RecipeDto.fromJson(json);
}

/// @nodoc
mixin _$RecipeDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get heroImageUrl => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  VideoSourceDto get videoSource => throw _privateConstructorUsedError;
  List<IngredientDto> get ingredients => throw _privateConstructorUsedError;
  List<InstructionStepDto> get instructions =>
      throw _privateConstructorUsedError;
  NutritionInfoDto? get nutrition => throw _privateConstructorUsedError;
  bool? get transcriptAvailable => throw _privateConstructorUsedError;

  /// Serializes this RecipeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeDtoCopyWith<RecipeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDtoCopyWith<$Res> {
  factory $RecipeDtoCopyWith(RecipeDto value, $Res Function(RecipeDto) then) =
      _$RecipeDtoCopyWithImpl<$Res, RecipeDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String heroImageUrl,
      double confidence,
      List<String> tags,
      VideoSourceDto videoSource,
      List<IngredientDto> ingredients,
      List<InstructionStepDto> instructions,
      NutritionInfoDto? nutrition,
      bool? transcriptAvailable});

  $VideoSourceDtoCopyWith<$Res> get videoSource;
  $NutritionInfoDtoCopyWith<$Res>? get nutrition;
}

/// @nodoc
class _$RecipeDtoCopyWithImpl<$Res, $Val extends RecipeDto>
    implements $RecipeDtoCopyWith<$Res> {
  _$RecipeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? heroImageUrl = null,
    Object? confidence = null,
    Object? tags = null,
    Object? videoSource = null,
    Object? ingredients = null,
    Object? instructions = null,
    Object? nutrition = freezed,
    Object? transcriptAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      heroImageUrl: null == heroImageUrl
          ? _value.heroImageUrl
          : heroImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoSource: null == videoSource
          ? _value.videoSource
          : videoSource // ignore: cast_nullable_to_non_nullable
              as VideoSourceDto,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientDto>,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<InstructionStepDto>,
      nutrition: freezed == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as NutritionInfoDto?,
      transcriptAvailable: freezed == transcriptAvailable
          ? _value.transcriptAvailable
          : transcriptAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  /// Create a copy of RecipeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoSourceDtoCopyWith<$Res> get videoSource {
    return $VideoSourceDtoCopyWith<$Res>(_value.videoSource, (value) {
      return _then(_value.copyWith(videoSource: value) as $Val);
    });
  }

  /// Create a copy of RecipeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionInfoDtoCopyWith<$Res>? get nutrition {
    if (_value.nutrition == null) {
      return null;
    }

    return $NutritionInfoDtoCopyWith<$Res>(_value.nutrition!, (value) {
      return _then(_value.copyWith(nutrition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeDtoImplCopyWith<$Res>
    implements $RecipeDtoCopyWith<$Res> {
  factory _$$RecipeDtoImplCopyWith(
          _$RecipeDtoImpl value, $Res Function(_$RecipeDtoImpl) then) =
      __$$RecipeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String heroImageUrl,
      double confidence,
      List<String> tags,
      VideoSourceDto videoSource,
      List<IngredientDto> ingredients,
      List<InstructionStepDto> instructions,
      NutritionInfoDto? nutrition,
      bool? transcriptAvailable});

  @override
  $VideoSourceDtoCopyWith<$Res> get videoSource;
  @override
  $NutritionInfoDtoCopyWith<$Res>? get nutrition;
}

/// @nodoc
class __$$RecipeDtoImplCopyWithImpl<$Res>
    extends _$RecipeDtoCopyWithImpl<$Res, _$RecipeDtoImpl>
    implements _$$RecipeDtoImplCopyWith<$Res> {
  __$$RecipeDtoImplCopyWithImpl(
      _$RecipeDtoImpl _value, $Res Function(_$RecipeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? heroImageUrl = null,
    Object? confidence = null,
    Object? tags = null,
    Object? videoSource = null,
    Object? ingredients = null,
    Object? instructions = null,
    Object? nutrition = freezed,
    Object? transcriptAvailable = freezed,
  }) {
    return _then(_$RecipeDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      heroImageUrl: null == heroImageUrl
          ? _value.heroImageUrl
          : heroImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      videoSource: null == videoSource
          ? _value.videoSource
          : videoSource // ignore: cast_nullable_to_non_nullable
              as VideoSourceDto,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientDto>,
      instructions: null == instructions
          ? _value._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<InstructionStepDto>,
      nutrition: freezed == nutrition
          ? _value.nutrition
          : nutrition // ignore: cast_nullable_to_non_nullable
              as NutritionInfoDto?,
      transcriptAvailable: freezed == transcriptAvailable
          ? _value.transcriptAvailable
          : transcriptAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeDtoImpl implements _RecipeDto {
  const _$RecipeDtoImpl(
      {required this.id,
      required this.title,
      required this.summary,
      required this.heroImageUrl,
      required this.confidence,
      required final List<String> tags,
      required this.videoSource,
      required final List<IngredientDto> ingredients,
      required final List<InstructionStepDto> instructions,
      this.nutrition,
      this.transcriptAvailable})
      : _tags = tags,
        _ingredients = ingredients,
        _instructions = instructions;

  factory _$RecipeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String summary;
  @override
  final String heroImageUrl;
  @override
  final double confidence;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final VideoSourceDto videoSource;
  final List<IngredientDto> _ingredients;
  @override
  List<IngredientDto> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<InstructionStepDto> _instructions;
  @override
  List<InstructionStepDto> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  @override
  final NutritionInfoDto? nutrition;
  @override
  final bool? transcriptAvailable;

  @override
  String toString() {
    return 'RecipeDto(id: $id, title: $title, summary: $summary, heroImageUrl: $heroImageUrl, confidence: $confidence, tags: $tags, videoSource: $videoSource, ingredients: $ingredients, instructions: $instructions, nutrition: $nutrition, transcriptAvailable: $transcriptAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.heroImageUrl, heroImageUrl) ||
                other.heroImageUrl == heroImageUrl) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.videoSource, videoSource) ||
                other.videoSource == videoSource) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality()
                .equals(other._instructions, _instructions) &&
            (identical(other.nutrition, nutrition) ||
                other.nutrition == nutrition) &&
            (identical(other.transcriptAvailable, transcriptAvailable) ||
                other.transcriptAvailable == transcriptAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      summary,
      heroImageUrl,
      confidence,
      const DeepCollectionEquality().hash(_tags),
      videoSource,
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_instructions),
      nutrition,
      transcriptAvailable);

  /// Create a copy of RecipeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeDtoImplCopyWith<_$RecipeDtoImpl> get copyWith =>
      __$$RecipeDtoImplCopyWithImpl<_$RecipeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeDtoImplToJson(
      this,
    );
  }
}

abstract class _RecipeDto implements RecipeDto {
  const factory _RecipeDto(
      {required final String id,
      required final String title,
      required final String summary,
      required final String heroImageUrl,
      required final double confidence,
      required final List<String> tags,
      required final VideoSourceDto videoSource,
      required final List<IngredientDto> ingredients,
      required final List<InstructionStepDto> instructions,
      final NutritionInfoDto? nutrition,
      final bool? transcriptAvailable}) = _$RecipeDtoImpl;

  factory _RecipeDto.fromJson(Map<String, dynamic> json) =
      _$RecipeDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get summary;
  @override
  String get heroImageUrl;
  @override
  double get confidence;
  @override
  List<String> get tags;
  @override
  VideoSourceDto get videoSource;
  @override
  List<IngredientDto> get ingredients;
  @override
  List<InstructionStepDto> get instructions;
  @override
  NutritionInfoDto? get nutrition;
  @override
  bool? get transcriptAvailable;

  /// Create a copy of RecipeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeDtoImplCopyWith<_$RecipeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IngredientDto _$IngredientDtoFromJson(Map<String, dynamic> json) {
  return _IngredientDto.fromJson(json);
}

/// @nodoc
mixin _$IngredientDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get quantity => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  String? get preparation => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this IngredientDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IngredientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientDtoCopyWith<IngredientDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientDtoCopyWith<$Res> {
  factory $IngredientDtoCopyWith(
          IngredientDto value, $Res Function(IngredientDto) then) =
      _$IngredientDtoCopyWithImpl<$Res, IngredientDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      double? quantity,
      String? unit,
      String? preparation,
      double confidence});
}

/// @nodoc
class _$IngredientDtoCopyWithImpl<$Res, $Val extends IngredientDto>
    implements $IngredientDtoCopyWith<$Res> {
  _$IngredientDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = freezed,
    Object? unit = freezed,
    Object? preparation = freezed,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      preparation: freezed == preparation
          ? _value.preparation
          : preparation // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientDtoImplCopyWith<$Res>
    implements $IngredientDtoCopyWith<$Res> {
  factory _$$IngredientDtoImplCopyWith(
          _$IngredientDtoImpl value, $Res Function(_$IngredientDtoImpl) then) =
      __$$IngredientDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double? quantity,
      String? unit,
      String? preparation,
      double confidence});
}

/// @nodoc
class __$$IngredientDtoImplCopyWithImpl<$Res>
    extends _$IngredientDtoCopyWithImpl<$Res, _$IngredientDtoImpl>
    implements _$$IngredientDtoImplCopyWith<$Res> {
  __$$IngredientDtoImplCopyWithImpl(
      _$IngredientDtoImpl _value, $Res Function(_$IngredientDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of IngredientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = freezed,
    Object? unit = freezed,
    Object? preparation = freezed,
    Object? confidence = null,
  }) {
    return _then(_$IngredientDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      preparation: freezed == preparation
          ? _value.preparation
          : preparation // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientDtoImpl implements _IngredientDto {
  const _$IngredientDtoImpl(
      {required this.id,
      required this.name,
      this.quantity,
      this.unit,
      this.preparation,
      required this.confidence});

  factory _$IngredientDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double? quantity;
  @override
  final String? unit;
  @override
  final String? preparation;
  @override
  final double confidence;

  @override
  String toString() {
    return 'IngredientDto(id: $id, name: $name, quantity: $quantity, unit: $unit, preparation: $preparation, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.preparation, preparation) ||
                other.preparation == preparation) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, quantity, unit, preparation, confidence);

  /// Create a copy of IngredientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientDtoImplCopyWith<_$IngredientDtoImpl> get copyWith =>
      __$$IngredientDtoImplCopyWithImpl<_$IngredientDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientDtoImplToJson(
      this,
    );
  }
}

abstract class _IngredientDto implements IngredientDto {
  const factory _IngredientDto(
      {required final String id,
      required final String name,
      final double? quantity,
      final String? unit,
      final String? preparation,
      required final double confidence}) = _$IngredientDtoImpl;

  factory _IngredientDto.fromJson(Map<String, dynamic> json) =
      _$IngredientDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double? get quantity;
  @override
  String? get unit;
  @override
  String? get preparation;
  @override
  double get confidence;

  /// Create a copy of IngredientDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientDtoImplCopyWith<_$IngredientDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InstructionStepDto _$InstructionStepDtoFromJson(Map<String, dynamic> json) {
  return _InstructionStepDto.fromJson(json);
}

/// @nodoc
mixin _$InstructionStepDto {
  String get id => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int? get timestampSeconds => throw _privateConstructorUsedError;
  String? get mediaSnapshotUrl => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this InstructionStepDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstructionStepDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstructionStepDtoCopyWith<InstructionStepDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionStepDtoCopyWith<$Res> {
  factory $InstructionStepDtoCopyWith(
          InstructionStepDto value, $Res Function(InstructionStepDto) then) =
      _$InstructionStepDtoCopyWithImpl<$Res, InstructionStepDto>;
  @useResult
  $Res call(
      {String id,
      int order,
      String description,
      int? timestampSeconds,
      String? mediaSnapshotUrl,
      double confidence});
}

/// @nodoc
class _$InstructionStepDtoCopyWithImpl<$Res, $Val extends InstructionStepDto>
    implements $InstructionStepDtoCopyWith<$Res> {
  _$InstructionStepDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstructionStepDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = null,
    Object? description = null,
    Object? timestampSeconds = freezed,
    Object? mediaSnapshotUrl = freezed,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestampSeconds: freezed == timestampSeconds
          ? _value.timestampSeconds
          : timestampSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaSnapshotUrl: freezed == mediaSnapshotUrl
          ? _value.mediaSnapshotUrl
          : mediaSnapshotUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstructionStepDtoImplCopyWith<$Res>
    implements $InstructionStepDtoCopyWith<$Res> {
  factory _$$InstructionStepDtoImplCopyWith(_$InstructionStepDtoImpl value,
          $Res Function(_$InstructionStepDtoImpl) then) =
      __$$InstructionStepDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int order,
      String description,
      int? timestampSeconds,
      String? mediaSnapshotUrl,
      double confidence});
}

/// @nodoc
class __$$InstructionStepDtoImplCopyWithImpl<$Res>
    extends _$InstructionStepDtoCopyWithImpl<$Res, _$InstructionStepDtoImpl>
    implements _$$InstructionStepDtoImplCopyWith<$Res> {
  __$$InstructionStepDtoImplCopyWithImpl(_$InstructionStepDtoImpl _value,
      $Res Function(_$InstructionStepDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstructionStepDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = null,
    Object? description = null,
    Object? timestampSeconds = freezed,
    Object? mediaSnapshotUrl = freezed,
    Object? confidence = null,
  }) {
    return _then(_$InstructionStepDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestampSeconds: freezed == timestampSeconds
          ? _value.timestampSeconds
          : timestampSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaSnapshotUrl: freezed == mediaSnapshotUrl
          ? _value.mediaSnapshotUrl
          : mediaSnapshotUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructionStepDtoImpl implements _InstructionStepDto {
  const _$InstructionStepDtoImpl(
      {required this.id,
      required this.order,
      required this.description,
      this.timestampSeconds,
      this.mediaSnapshotUrl,
      required this.confidence});

  factory _$InstructionStepDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructionStepDtoImplFromJson(json);

  @override
  final String id;
  @override
  final int order;
  @override
  final String description;
  @override
  final int? timestampSeconds;
  @override
  final String? mediaSnapshotUrl;
  @override
  final double confidence;

  @override
  String toString() {
    return 'InstructionStepDto(id: $id, order: $order, description: $description, timestampSeconds: $timestampSeconds, mediaSnapshotUrl: $mediaSnapshotUrl, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructionStepDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestampSeconds, timestampSeconds) ||
                other.timestampSeconds == timestampSeconds) &&
            (identical(other.mediaSnapshotUrl, mediaSnapshotUrl) ||
                other.mediaSnapshotUrl == mediaSnapshotUrl) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, order, description,
      timestampSeconds, mediaSnapshotUrl, confidence);

  /// Create a copy of InstructionStepDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructionStepDtoImplCopyWith<_$InstructionStepDtoImpl> get copyWith =>
      __$$InstructionStepDtoImplCopyWithImpl<_$InstructionStepDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructionStepDtoImplToJson(
      this,
    );
  }
}

abstract class _InstructionStepDto implements InstructionStepDto {
  const factory _InstructionStepDto(
      {required final String id,
      required final int order,
      required final String description,
      final int? timestampSeconds,
      final String? mediaSnapshotUrl,
      required final double confidence}) = _$InstructionStepDtoImpl;

  factory _InstructionStepDto.fromJson(Map<String, dynamic> json) =
      _$InstructionStepDtoImpl.fromJson;

  @override
  String get id;
  @override
  int get order;
  @override
  String get description;
  @override
  int? get timestampSeconds;
  @override
  String? get mediaSnapshotUrl;
  @override
  double get confidence;

  /// Create a copy of InstructionStepDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstructionStepDtoImplCopyWith<_$InstructionStepDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NutritionInfoDto _$NutritionInfoDtoFromJson(Map<String, dynamic> json) {
  return _NutritionInfoDto.fromJson(json);
}

/// @nodoc
mixin _$NutritionInfoDto {
  int? get calories => throw _privateConstructorUsedError;
  double? get proteinGrams => throw _privateConstructorUsedError;
  double? get carbsGrams => throw _privateConstructorUsedError;
  double? get fatGrams => throw _privateConstructorUsedError;
  int? get servings => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this NutritionInfoDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionInfoDtoCopyWith<NutritionInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionInfoDtoCopyWith<$Res> {
  factory $NutritionInfoDtoCopyWith(
          NutritionInfoDto value, $Res Function(NutritionInfoDto) then) =
      _$NutritionInfoDtoCopyWithImpl<$Res, NutritionInfoDto>;
  @useResult
  $Res call(
      {int? calories,
      double? proteinGrams,
      double? carbsGrams,
      double? fatGrams,
      int? servings,
      String? notes});
}

/// @nodoc
class _$NutritionInfoDtoCopyWithImpl<$Res, $Val extends NutritionInfoDto>
    implements $NutritionInfoDtoCopyWith<$Res> {
  _$NutritionInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = freezed,
    Object? proteinGrams = freezed,
    Object? carbsGrams = freezed,
    Object? fatGrams = freezed,
    Object? servings = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      proteinGrams: freezed == proteinGrams
          ? _value.proteinGrams
          : proteinGrams // ignore: cast_nullable_to_non_nullable
              as double?,
      carbsGrams: freezed == carbsGrams
          ? _value.carbsGrams
          : carbsGrams // ignore: cast_nullable_to_non_nullable
              as double?,
      fatGrams: freezed == fatGrams
          ? _value.fatGrams
          : fatGrams // ignore: cast_nullable_to_non_nullable
              as double?,
      servings: freezed == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionInfoDtoImplCopyWith<$Res>
    implements $NutritionInfoDtoCopyWith<$Res> {
  factory _$$NutritionInfoDtoImplCopyWith(_$NutritionInfoDtoImpl value,
          $Res Function(_$NutritionInfoDtoImpl) then) =
      __$$NutritionInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? calories,
      double? proteinGrams,
      double? carbsGrams,
      double? fatGrams,
      int? servings,
      String? notes});
}

/// @nodoc
class __$$NutritionInfoDtoImplCopyWithImpl<$Res>
    extends _$NutritionInfoDtoCopyWithImpl<$Res, _$NutritionInfoDtoImpl>
    implements _$$NutritionInfoDtoImplCopyWith<$Res> {
  __$$NutritionInfoDtoImplCopyWithImpl(_$NutritionInfoDtoImpl _value,
      $Res Function(_$NutritionInfoDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = freezed,
    Object? proteinGrams = freezed,
    Object? carbsGrams = freezed,
    Object? fatGrams = freezed,
    Object? servings = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$NutritionInfoDtoImpl(
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      proteinGrams: freezed == proteinGrams
          ? _value.proteinGrams
          : proteinGrams // ignore: cast_nullable_to_non_nullable
              as double?,
      carbsGrams: freezed == carbsGrams
          ? _value.carbsGrams
          : carbsGrams // ignore: cast_nullable_to_non_nullable
              as double?,
      fatGrams: freezed == fatGrams
          ? _value.fatGrams
          : fatGrams // ignore: cast_nullable_to_non_nullable
              as double?,
      servings: freezed == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionInfoDtoImpl implements _NutritionInfoDto {
  const _$NutritionInfoDtoImpl(
      {this.calories,
      this.proteinGrams,
      this.carbsGrams,
      this.fatGrams,
      this.servings,
      this.notes});

  factory _$NutritionInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionInfoDtoImplFromJson(json);

  @override
  final int? calories;
  @override
  final double? proteinGrams;
  @override
  final double? carbsGrams;
  @override
  final double? fatGrams;
  @override
  final int? servings;
  @override
  final String? notes;

  @override
  String toString() {
    return 'NutritionInfoDto(calories: $calories, proteinGrams: $proteinGrams, carbsGrams: $carbsGrams, fatGrams: $fatGrams, servings: $servings, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionInfoDtoImpl &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.proteinGrams, proteinGrams) ||
                other.proteinGrams == proteinGrams) &&
            (identical(other.carbsGrams, carbsGrams) ||
                other.carbsGrams == carbsGrams) &&
            (identical(other.fatGrams, fatGrams) ||
                other.fatGrams == fatGrams) &&
            (identical(other.servings, servings) ||
                other.servings == servings) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, calories, proteinGrams,
      carbsGrams, fatGrams, servings, notes);

  /// Create a copy of NutritionInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionInfoDtoImplCopyWith<_$NutritionInfoDtoImpl> get copyWith =>
      __$$NutritionInfoDtoImplCopyWithImpl<_$NutritionInfoDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _NutritionInfoDto implements NutritionInfoDto {
  const factory _NutritionInfoDto(
      {final int? calories,
      final double? proteinGrams,
      final double? carbsGrams,
      final double? fatGrams,
      final int? servings,
      final String? notes}) = _$NutritionInfoDtoImpl;

  factory _NutritionInfoDto.fromJson(Map<String, dynamic> json) =
      _$NutritionInfoDtoImpl.fromJson;

  @override
  int? get calories;
  @override
  double? get proteinGrams;
  @override
  double? get carbsGrams;
  @override
  double? get fatGrams;
  @override
  int? get servings;
  @override
  String? get notes;

  /// Create a copy of NutritionInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionInfoDtoImplCopyWith<_$NutritionInfoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoSourceDto _$VideoSourceDtoFromJson(Map<String, dynamic> json) {
  return _VideoSourceDto.fromJson(json);
}

/// @nodoc
mixin _$VideoSourceDto {
  String get id => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get creatorHandle => throw _privateConstructorUsedError;
  String get sourceUrl => throw _privateConstructorUsedError;
  DateTime get publishedAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int? get durationSeconds => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;

  /// Serializes this VideoSourceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoSourceDtoCopyWith<VideoSourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoSourceDtoCopyWith<$Res> {
  factory $VideoSourceDtoCopyWith(
          VideoSourceDto value, $Res Function(VideoSourceDto) then) =
      _$VideoSourceDtoCopyWithImpl<$Res, VideoSourceDto>;
  @useResult
  $Res call(
      {String id,
      String platform,
      String creatorHandle,
      String sourceUrl,
      DateTime publishedAt,
      String status,
      int? durationSeconds,
      int? viewCount});
}

/// @nodoc
class _$VideoSourceDtoCopyWithImpl<$Res, $Val extends VideoSourceDto>
    implements $VideoSourceDtoCopyWith<$Res> {
  _$VideoSourceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? platform = null,
    Object? creatorHandle = null,
    Object? sourceUrl = null,
    Object? publishedAt = null,
    Object? status = null,
    Object? durationSeconds = freezed,
    Object? viewCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      creatorHandle: null == creatorHandle
          ? _value.creatorHandle
          : creatorHandle // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUrl: null == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoSourceDtoImplCopyWith<$Res>
    implements $VideoSourceDtoCopyWith<$Res> {
  factory _$$VideoSourceDtoImplCopyWith(_$VideoSourceDtoImpl value,
          $Res Function(_$VideoSourceDtoImpl) then) =
      __$$VideoSourceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String platform,
      String creatorHandle,
      String sourceUrl,
      DateTime publishedAt,
      String status,
      int? durationSeconds,
      int? viewCount});
}

/// @nodoc
class __$$VideoSourceDtoImplCopyWithImpl<$Res>
    extends _$VideoSourceDtoCopyWithImpl<$Res, _$VideoSourceDtoImpl>
    implements _$$VideoSourceDtoImplCopyWith<$Res> {
  __$$VideoSourceDtoImplCopyWithImpl(
      _$VideoSourceDtoImpl _value, $Res Function(_$VideoSourceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? platform = null,
    Object? creatorHandle = null,
    Object? sourceUrl = null,
    Object? publishedAt = null,
    Object? status = null,
    Object? durationSeconds = freezed,
    Object? viewCount = freezed,
  }) {
    return _then(_$VideoSourceDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      creatorHandle: null == creatorHandle
          ? _value.creatorHandle
          : creatorHandle // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUrl: null == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoSourceDtoImpl implements _VideoSourceDto {
  const _$VideoSourceDtoImpl(
      {required this.id,
      required this.platform,
      required this.creatorHandle,
      required this.sourceUrl,
      required this.publishedAt,
      required this.status,
      this.durationSeconds,
      this.viewCount});

  factory _$VideoSourceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoSourceDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String platform;
  @override
  final String creatorHandle;
  @override
  final String sourceUrl;
  @override
  final DateTime publishedAt;
  @override
  final String status;
  @override
  final int? durationSeconds;
  @override
  final int? viewCount;

  @override
  String toString() {
    return 'VideoSourceDto(id: $id, platform: $platform, creatorHandle: $creatorHandle, sourceUrl: $sourceUrl, publishedAt: $publishedAt, status: $status, durationSeconds: $durationSeconds, viewCount: $viewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoSourceDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.creatorHandle, creatorHandle) ||
                other.creatorHandle == creatorHandle) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, platform, creatorHandle,
      sourceUrl, publishedAt, status, durationSeconds, viewCount);

  /// Create a copy of VideoSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoSourceDtoImplCopyWith<_$VideoSourceDtoImpl> get copyWith =>
      __$$VideoSourceDtoImplCopyWithImpl<_$VideoSourceDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoSourceDtoImplToJson(
      this,
    );
  }
}

abstract class _VideoSourceDto implements VideoSourceDto {
  const factory _VideoSourceDto(
      {required final String id,
      required final String platform,
      required final String creatorHandle,
      required final String sourceUrl,
      required final DateTime publishedAt,
      required final String status,
      final int? durationSeconds,
      final int? viewCount}) = _$VideoSourceDtoImpl;

  factory _VideoSourceDto.fromJson(Map<String, dynamic> json) =
      _$VideoSourceDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get platform;
  @override
  String get creatorHandle;
  @override
  String get sourceUrl;
  @override
  DateTime get publishedAt;
  @override
  String get status;
  @override
  int? get durationSeconds;
  @override
  int? get viewCount;

  /// Create a copy of VideoSourceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoSourceDtoImplCopyWith<_$VideoSourceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TranscriptEntryDto _$TranscriptEntryDtoFromJson(Map<String, dynamic> json) {
  return _TranscriptEntryDto.fromJson(json);
}

/// @nodoc
mixin _$TranscriptEntryDto {
  double get startSeconds => throw _privateConstructorUsedError;
  double get endSeconds => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this TranscriptEntryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranscriptEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranscriptEntryDtoCopyWith<TranscriptEntryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscriptEntryDtoCopyWith<$Res> {
  factory $TranscriptEntryDtoCopyWith(
          TranscriptEntryDto value, $Res Function(TranscriptEntryDto) then) =
      _$TranscriptEntryDtoCopyWithImpl<$Res, TranscriptEntryDto>;
  @useResult
  $Res call({double startSeconds, double endSeconds, String text});
}

/// @nodoc
class _$TranscriptEntryDtoCopyWithImpl<$Res, $Val extends TranscriptEntryDto>
    implements $TranscriptEntryDtoCopyWith<$Res> {
  _$TranscriptEntryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranscriptEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startSeconds = null,
    Object? endSeconds = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      startSeconds: null == startSeconds
          ? _value.startSeconds
          : startSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      endSeconds: null == endSeconds
          ? _value.endSeconds
          : endSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranscriptEntryDtoImplCopyWith<$Res>
    implements $TranscriptEntryDtoCopyWith<$Res> {
  factory _$$TranscriptEntryDtoImplCopyWith(_$TranscriptEntryDtoImpl value,
          $Res Function(_$TranscriptEntryDtoImpl) then) =
      __$$TranscriptEntryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double startSeconds, double endSeconds, String text});
}

/// @nodoc
class __$$TranscriptEntryDtoImplCopyWithImpl<$Res>
    extends _$TranscriptEntryDtoCopyWithImpl<$Res, _$TranscriptEntryDtoImpl>
    implements _$$TranscriptEntryDtoImplCopyWith<$Res> {
  __$$TranscriptEntryDtoImplCopyWithImpl(_$TranscriptEntryDtoImpl _value,
      $Res Function(_$TranscriptEntryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscriptEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startSeconds = null,
    Object? endSeconds = null,
    Object? text = null,
  }) {
    return _then(_$TranscriptEntryDtoImpl(
      startSeconds: null == startSeconds
          ? _value.startSeconds
          : startSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      endSeconds: null == endSeconds
          ? _value.endSeconds
          : endSeconds // ignore: cast_nullable_to_non_nullable
              as double,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranscriptEntryDtoImpl implements _TranscriptEntryDto {
  const _$TranscriptEntryDtoImpl(
      {required this.startSeconds,
      required this.endSeconds,
      required this.text});

  factory _$TranscriptEntryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranscriptEntryDtoImplFromJson(json);

  @override
  final double startSeconds;
  @override
  final double endSeconds;
  @override
  final String text;

  @override
  String toString() {
    return 'TranscriptEntryDto(startSeconds: $startSeconds, endSeconds: $endSeconds, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscriptEntryDtoImpl &&
            (identical(other.startSeconds, startSeconds) ||
                other.startSeconds == startSeconds) &&
            (identical(other.endSeconds, endSeconds) ||
                other.endSeconds == endSeconds) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startSeconds, endSeconds, text);

  /// Create a copy of TranscriptEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscriptEntryDtoImplCopyWith<_$TranscriptEntryDtoImpl> get copyWith =>
      __$$TranscriptEntryDtoImplCopyWithImpl<_$TranscriptEntryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranscriptEntryDtoImplToJson(
      this,
    );
  }
}

abstract class _TranscriptEntryDto implements TranscriptEntryDto {
  const factory _TranscriptEntryDto(
      {required final double startSeconds,
      required final double endSeconds,
      required final String text}) = _$TranscriptEntryDtoImpl;

  factory _TranscriptEntryDto.fromJson(Map<String, dynamic> json) =
      _$TranscriptEntryDtoImpl.fromJson;

  @override
  double get startSeconds;
  @override
  double get endSeconds;
  @override
  String get text;

  /// Create a copy of TranscriptEntryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscriptEntryDtoImplCopyWith<_$TranscriptEntryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeTranscriptDto _$RecipeTranscriptDtoFromJson(Map<String, dynamic> json) {
  return _RecipeTranscriptDto.fromJson(json);
}

/// @nodoc
mixin _$RecipeTranscriptDto {
  List<TranscriptEntryDto> get transcript => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  double? get confidence => throw _privateConstructorUsedError;

  /// Serializes this RecipeTranscriptDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeTranscriptDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeTranscriptDtoCopyWith<RecipeTranscriptDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeTranscriptDtoCopyWith<$Res> {
  factory $RecipeTranscriptDtoCopyWith(
          RecipeTranscriptDto value, $Res Function(RecipeTranscriptDto) then) =
      _$RecipeTranscriptDtoCopyWithImpl<$Res, RecipeTranscriptDto>;
  @useResult
  $Res call(
      {List<TranscriptEntryDto> transcript,
      String? language,
      double? confidence});
}

/// @nodoc
class _$RecipeTranscriptDtoCopyWithImpl<$Res, $Val extends RecipeTranscriptDto>
    implements $RecipeTranscriptDtoCopyWith<$Res> {
  _$RecipeTranscriptDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeTranscriptDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transcript = null,
    Object? language = freezed,
    Object? confidence = freezed,
  }) {
    return _then(_value.copyWith(
      transcript: null == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as List<TranscriptEntryDto>,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeTranscriptDtoImplCopyWith<$Res>
    implements $RecipeTranscriptDtoCopyWith<$Res> {
  factory _$$RecipeTranscriptDtoImplCopyWith(_$RecipeTranscriptDtoImpl value,
          $Res Function(_$RecipeTranscriptDtoImpl) then) =
      __$$RecipeTranscriptDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TranscriptEntryDto> transcript,
      String? language,
      double? confidence});
}

/// @nodoc
class __$$RecipeTranscriptDtoImplCopyWithImpl<$Res>
    extends _$RecipeTranscriptDtoCopyWithImpl<$Res, _$RecipeTranscriptDtoImpl>
    implements _$$RecipeTranscriptDtoImplCopyWith<$Res> {
  __$$RecipeTranscriptDtoImplCopyWithImpl(_$RecipeTranscriptDtoImpl _value,
      $Res Function(_$RecipeTranscriptDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeTranscriptDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transcript = null,
    Object? language = freezed,
    Object? confidence = freezed,
  }) {
    return _then(_$RecipeTranscriptDtoImpl(
      transcript: null == transcript
          ? _value._transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as List<TranscriptEntryDto>,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeTranscriptDtoImpl implements _RecipeTranscriptDto {
  const _$RecipeTranscriptDtoImpl(
      {final List<TranscriptEntryDto> transcript = const <TranscriptEntryDto>[],
      this.language,
      this.confidence})
      : _transcript = transcript;

  factory _$RecipeTranscriptDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeTranscriptDtoImplFromJson(json);

  final List<TranscriptEntryDto> _transcript;
  @override
  @JsonKey()
  List<TranscriptEntryDto> get transcript {
    if (_transcript is EqualUnmodifiableListView) return _transcript;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transcript);
  }

  @override
  final String? language;
  @override
  final double? confidence;

  @override
  String toString() {
    return 'RecipeTranscriptDto(transcript: $transcript, language: $language, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeTranscriptDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._transcript, _transcript) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transcript), language, confidence);

  /// Create a copy of RecipeTranscriptDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeTranscriptDtoImplCopyWith<_$RecipeTranscriptDtoImpl> get copyWith =>
      __$$RecipeTranscriptDtoImplCopyWithImpl<_$RecipeTranscriptDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeTranscriptDtoImplToJson(
      this,
    );
  }
}

abstract class _RecipeTranscriptDto implements RecipeTranscriptDto {
  const factory _RecipeTranscriptDto(
      {final List<TranscriptEntryDto> transcript,
      final String? language,
      final double? confidence}) = _$RecipeTranscriptDtoImpl;

  factory _RecipeTranscriptDto.fromJson(Map<String, dynamic> json) =
      _$RecipeTranscriptDtoImpl.fromJson;

  @override
  List<TranscriptEntryDto> get transcript;
  @override
  String? get language;
  @override
  double? get confidence;

  /// Create a copy of RecipeTranscriptDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeTranscriptDtoImplCopyWith<_$RecipeTranscriptDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
