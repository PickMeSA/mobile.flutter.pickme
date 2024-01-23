// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'information_item_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InformationItemModelResponse _$InformationItemModelResponseFromJson(
    Map<String, dynamic> json) {
  return _InformationItemModelResponse.fromJson(json);
}

/// @nodoc
mixin _$InformationItemModelResponse {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InformationItemModelResponseCopyWith<InformationItemModelResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformationItemModelResponseCopyWith<$Res> {
  factory $InformationItemModelResponseCopyWith(
          InformationItemModelResponse value,
          $Res Function(InformationItemModelResponse) then) =
      _$InformationItemModelResponseCopyWithImpl<$Res,
          InformationItemModelResponse>;
  @useResult
  $Res call({String? title, String? description});
}

/// @nodoc
class _$InformationItemModelResponseCopyWithImpl<$Res,
        $Val extends InformationItemModelResponse>
    implements $InformationItemModelResponseCopyWith<$Res> {
  _$InformationItemModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InformationItemModelResponseImplCopyWith<$Res>
    implements $InformationItemModelResponseCopyWith<$Res> {
  factory _$$InformationItemModelResponseImplCopyWith(
          _$InformationItemModelResponseImpl value,
          $Res Function(_$InformationItemModelResponseImpl) then) =
      __$$InformationItemModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? description});
}

/// @nodoc
class __$$InformationItemModelResponseImplCopyWithImpl<$Res>
    extends _$InformationItemModelResponseCopyWithImpl<$Res,
        _$InformationItemModelResponseImpl>
    implements _$$InformationItemModelResponseImplCopyWith<$Res> {
  __$$InformationItemModelResponseImplCopyWithImpl(
      _$InformationItemModelResponseImpl _value,
      $Res Function(_$InformationItemModelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$InformationItemModelResponseImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InformationItemModelResponseImpl
    with DiagnosticableTreeMixin
    implements _InformationItemModelResponse {
  const _$InformationItemModelResponseImpl(
      {required this.title, required this.description});

  factory _$InformationItemModelResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InformationItemModelResponseImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InformationItemModelResponse(title: $title, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InformationItemModelResponse'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InformationItemModelResponseImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InformationItemModelResponseImplCopyWith<
          _$InformationItemModelResponseImpl>
      get copyWith => __$$InformationItemModelResponseImplCopyWithImpl<
          _$InformationItemModelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InformationItemModelResponseImplToJson(
      this,
    );
  }
}

abstract class _InformationItemModelResponse
    implements InformationItemModelResponse {
  const factory _InformationItemModelResponse(
      {required final String? title,
      required final String? description}) = _$InformationItemModelResponseImpl;

  factory _InformationItemModelResponse.fromJson(Map<String, dynamic> json) =
      _$InformationItemModelResponseImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$InformationItemModelResponseImplCopyWith<
          _$InformationItemModelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
