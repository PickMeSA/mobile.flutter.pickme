// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_item_list_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MembershipItemListModelResponse _$MembershipItemListModelResponseFromJson(
    Map<String, dynamic> json) {
  return _MembershipItemListModelResponse.fromJson(json);
}

/// @nodoc
mixin _$MembershipItemListModelResponse {
  List<MembershipItemModelResponse> get membershipItemListModelResponse =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MembershipItemListModelResponseCopyWith<MembershipItemListModelResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipItemListModelResponseCopyWith<$Res> {
  factory $MembershipItemListModelResponseCopyWith(
          MembershipItemListModelResponse value,
          $Res Function(MembershipItemListModelResponse) then) =
      _$MembershipItemListModelResponseCopyWithImpl<$Res,
          MembershipItemListModelResponse>;
  @useResult
  $Res call(
      {List<MembershipItemModelResponse> membershipItemListModelResponse});
}

/// @nodoc
class _$MembershipItemListModelResponseCopyWithImpl<$Res,
        $Val extends MembershipItemListModelResponse>
    implements $MembershipItemListModelResponseCopyWith<$Res> {
  _$MembershipItemListModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? membershipItemListModelResponse = null,
  }) {
    return _then(_value.copyWith(
      membershipItemListModelResponse: null == membershipItemListModelResponse
          ? _value.membershipItemListModelResponse
          : membershipItemListModelResponse // ignore: cast_nullable_to_non_nullable
              as List<MembershipItemModelResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MembershipItemListModelResponseImplCopyWith<$Res>
    implements $MembershipItemListModelResponseCopyWith<$Res> {
  factory _$$MembershipItemListModelResponseImplCopyWith(
          _$MembershipItemListModelResponseImpl value,
          $Res Function(_$MembershipItemListModelResponseImpl) then) =
      __$$MembershipItemListModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MembershipItemModelResponse> membershipItemListModelResponse});
}

/// @nodoc
class __$$MembershipItemListModelResponseImplCopyWithImpl<$Res>
    extends _$MembershipItemListModelResponseCopyWithImpl<$Res,
        _$MembershipItemListModelResponseImpl>
    implements _$$MembershipItemListModelResponseImplCopyWith<$Res> {
  __$$MembershipItemListModelResponseImplCopyWithImpl(
      _$MembershipItemListModelResponseImpl _value,
      $Res Function(_$MembershipItemListModelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? membershipItemListModelResponse = null,
  }) {
    return _then(_$MembershipItemListModelResponseImpl(
      membershipItemListModelResponse: null == membershipItemListModelResponse
          ? _value._membershipItemListModelResponse
          : membershipItemListModelResponse // ignore: cast_nullable_to_non_nullable
              as List<MembershipItemModelResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MembershipItemListModelResponseImpl
    with DiagnosticableTreeMixin
    implements _MembershipItemListModelResponse {
  const _$MembershipItemListModelResponseImpl(
      {required final List<MembershipItemModelResponse>
          membershipItemListModelResponse})
      : _membershipItemListModelResponse = membershipItemListModelResponse;

  factory _$MembershipItemListModelResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MembershipItemListModelResponseImplFromJson(json);

  final List<MembershipItemModelResponse> _membershipItemListModelResponse;
  @override
  List<MembershipItemModelResponse> get membershipItemListModelResponse {
    if (_membershipItemListModelResponse is EqualUnmodifiableListView)
      return _membershipItemListModelResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_membershipItemListModelResponse);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MembershipItemListModelResponse(membershipItemListModelResponse: $membershipItemListModelResponse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MembershipItemListModelResponse'))
      ..add(DiagnosticsProperty(
          'membershipItemListModelResponse', membershipItemListModelResponse));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MembershipItemListModelResponseImpl &&
            const DeepCollectionEquality().equals(
                other._membershipItemListModelResponse,
                _membershipItemListModelResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_membershipItemListModelResponse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MembershipItemListModelResponseImplCopyWith<
          _$MembershipItemListModelResponseImpl>
      get copyWith => __$$MembershipItemListModelResponseImplCopyWithImpl<
          _$MembershipItemListModelResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MembershipItemListModelResponseImplToJson(
      this,
    );
  }
}

abstract class _MembershipItemListModelResponse
    implements MembershipItemListModelResponse {
  const factory _MembershipItemListModelResponse(
          {required final List<MembershipItemModelResponse>
              membershipItemListModelResponse}) =
      _$MembershipItemListModelResponseImpl;

  factory _MembershipItemListModelResponse.fromJson(Map<String, dynamic> json) =
      _$MembershipItemListModelResponseImpl.fromJson;

  @override
  List<MembershipItemModelResponse> get membershipItemListModelResponse;
  @override
  @JsonKey(ignore: true)
  _$$MembershipItemListModelResponseImplCopyWith<
          _$MembershipItemListModelResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
