import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickme/features/membership_information/data/response_models/information_item_model_response/information_item_model_response.dart';
import 'package:pickme/features/membership_information/domain/membership_item_entity.dart';

part 'membership_item_model_response.freezed.dart';
part 'membership_item_model_response.g.dart';

@freezed
class MembershipItemModelResponse with _$MembershipItemModelResponse {
  const factory MembershipItemModelResponse({
   required String name,
   required String description,
    required List<InformationItemModelResponse> information
  }) = _MembershipItemModelResponse;

  factory MembershipItemModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$MembershipItemModelResponseFromJson(json);
}
