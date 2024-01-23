// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup-profile_remote-submit_profile_type_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetupProfileSubmitprofileTypeModelResponse
    _$SetupProfileSubmitprofileTypeModelResponseFromJson(
        Map<String, dynamic> json) {
  return _SetupProfileSubmitprofileTypeModelResponse.fromJson(json);
}

/// @nodoc
mixin _$SetupProfileSubmitprofileTypeModelResponse {
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetupProfileSubmitprofileTypeModelResponseCopyWith<
          SetupProfileSubmitprofileTypeModelResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetupProfileSubmitprofileTypeModelResponseCopyWith<$Res> {
  factory $SetupProfileSubmitprofileTypeModelResponseCopyWith(
          SetupProfileSubmitprofileTypeModelResponse value,
          $Res Function(SetupProfileSubmitprofileTypeModelResponse) then) =
      _$SetupProfileSubmitprofileTypeModelResponseCopyWithImpl<$Res,
          SetupProfileSubmitprofileTypeModelResponse>;
  @useResult
  $Res call({String? type});
}

/// @nodoc
class _$SetupProfileSubmitprofileTypeModelResponseCopyWithImpl<$Res,
        $Val extends SetupProfileSubmitprofileTypeModelResponse>
    implements $SetupProfileSubmitprofileTypeModelResponseCopyWith<$Res> {
  _$SetupProfileSubmitprofileTypeModelResponseCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetupProfileSubmitprofileTypeModelResponseImplCopyWith<$Res>
    implements $SetupProfileSubmitprofileTypeModelResponseCopyWith<$Res> {
  factory _$$SetupProfileSubmitprofileTypeModelResponseImplCopyWith(
          _$SetupProfileSubmitprofileTypeModelResponseImpl value,
          $Res Function(_$SetupProfileSubmitprofileTypeModelResponseImpl)
              then) =
      __$$SetupProfileSubmitprofileTypeModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type});
}

/// @nodoc
class __$$SetupProfileSubmitprofileTypeModelResponseImplCopyWithImpl<$Res>
    extends _$SetupProfileSubmitprofileTypeModelResponseCopyWithImpl<$Res,
        _$SetupProfileSubmitprofileTypeModelResponseImpl>
    implements _$$SetupProfileSubmitprofileTypeModelResponseImplCopyWith<$Res> {
  __$$SetupProfileSubmitprofileTypeModelResponseImplCopyWithImpl(
      _$SetupProfileSubmitprofileTypeModelResponseImpl _value,
      $Res Function(_$SetupProfileSubmitprofileTypeModelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$SetupProfileSubmitprofileTypeModelResponseImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetupProfileSubmitprofileTypeModelResponseImpl
    with DiagnosticableTreeMixin
    implements _SetupProfileSubmitprofileTypeModelResponse {
  const _$SetupProfileSubmitprofileTypeModelResponseImpl({required this.type});

  factory _$SetupProfileSubmitprofileTypeModelResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SetupProfileSubmitprofileTypeModelResponseImplFromJson(json);

  @override
  final String? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SetupProfileSubmitprofileTypeModelResponse(type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SetupProfileSubmitprofileTypeModelResponse'))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetupProfileSubmitprofileTypeModelResponseImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetupProfileSubmitprofileTypeModelResponseImplCopyWith<
          _$SetupProfileSubmitprofileTypeModelResponseImpl>
      get copyWith =>
          __$$SetupProfileSubmitprofileTypeModelResponseImplCopyWithImpl<
                  _$SetupProfileSubmitprofileTypeModelResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetupProfileSubmitprofileTypeModelResponseImplToJson(
      this,
    );
  }
}

abstract class _SetupProfileSubmitprofileTypeModelResponse
    implements SetupProfileSubmitprofileTypeModelResponse {
  const factory _SetupProfileSubmitprofileTypeModelResponse(
          {required final String? type}) =
      _$SetupProfileSubmitprofileTypeModelResponseImpl;

  factory _SetupProfileSubmitprofileTypeModelResponse.fromJson(
          Map<String, dynamic> json) =
      _$SetupProfileSubmitprofileTypeModelResponseImpl.fromJson;

  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$SetupProfileSubmitprofileTypeModelResponseImplCopyWith<
          _$SetupProfileSubmitprofileTypeModelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
