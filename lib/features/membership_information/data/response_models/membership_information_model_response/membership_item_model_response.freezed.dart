// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_item_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MembershipItemModelResponse _$MembershipItemModelResponseFromJson(
    Map<String, dynamic> json) {
  return _MembershipItemModelResponse.fromJson(json);
}

/// @nodoc
mixin _$MembershipItemModelResponse {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<InformationItemModelResponse> get information =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MembershipItemModelResponseCopyWith<MembershipItemModelResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipItemModelResponseCopyWith<$Res> {
  factory $MembershipItemModelResponseCopyWith(
          MembershipItemModelResponse value,
          $Res Function(MembershipItemModelResponse) then) =
      _$MembershipItemModelResponseCopyWithImpl<$Res,
          MembershipItemModelResponse>;
  @useResult
  $Res call(
      {String name,
      String description,
      List<InformationItemModelResponse> information});
}

/// @nodoc
class _$MembershipItemModelResponseCopyWithImpl<$Res,
        $Val extends MembershipItemModelResponse>
    implements $MembershipItemModelResponseCopyWith<$Res> {
  _$MembershipItemModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? information = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as List<InformationItemModelResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MembershipItemModelResponseImplCopyWith<$Res>
    implements $MembershipItemModelResponseCopyWith<$Res> {
  factory _$$MembershipItemModelResponseImplCopyWith(
          _$MembershipItemModelResponseImpl value,
          $Res Function(_$MembershipItemModelResponseImpl) then) =
      __$$MembershipItemModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      List<InformationItemModelResponse> information});
}

/// @nodoc
class __$$MembershipItemModelResponseImplCopyWithImpl<$Res>
    extends _$MembershipItemModelResponseCopyWithImpl<$Res,
        _$MembershipItemModelResponseImpl>
    implements _$$MembershipItemModelResponseImplCopyWith<$Res> {
  __$$MembershipItemModelResponseImplCopyWithImpl(
      _$MembershipItemModelResponseImpl _value,
      $Res Function(_$MembershipItemModelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? information = null,
  }) {
    return _then(_$MembershipItemModelResponseImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _value._information
          : information // ignore: cast_nullable_to_non_nullable
              as List<InformationItemModelResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MembershipItemModelResponseImpl
    with DiagnosticableTreeMixin
    implements _MembershipItemModelResponse {
  const _$MembershipItemModelResponseImpl(
      {required this.name,
      required this.description,
      required final List<InformationItemModelResponse> information})
      : _information = information;

  factory _$MembershipItemModelResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MembershipItemModelResponseImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  final List<InformationItemModelResponse> _information;
  @override
  List<InformationItemModelResponse> get information {
    if (_information is EqualUnmodifiableListView) return _information;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_information);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MembershipItemModelResponse(name: $name, description: $description, information: $information)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MembershipItemModelResponse'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('information', information));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MembershipItemModelResponseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._information, _information));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description,
      const DeepCollectionEquality().hash(_information));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MembershipItemModelResponseImplCopyWith<_$MembershipItemModelResponseImpl>
      get copyWith => __$$MembershipItemModelResponseImplCopyWithImpl<
          _$MembershipItemModelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MembershipItemModelResponseImplToJson(
      this,
    );
  }
}

abstract class _MembershipItemModelResponse
    implements MembershipItemModelResponse {
  const factory _MembershipItemModelResponse(
          {required final String name,
          required final String description,
          required final List<InformationItemModelResponse> information}) =
      _$MembershipItemModelResponseImpl;

  factory _MembershipItemModelResponse.fromJson(Map<String, dynamic> json) =
      _$MembershipItemModelResponseImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  List<InformationItemModelResponse> get information;
  @override
  @JsonKey(ignore: true)
  _$$MembershipItemModelResponseImplCopyWith<_$MembershipItemModelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
