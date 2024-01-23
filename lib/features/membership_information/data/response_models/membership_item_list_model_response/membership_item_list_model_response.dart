import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../membership_information_model_response/membership_item_model_response.dart';

part 'membership_item_list_model_response.freezed.dart';
part 'membership_item_list_model_response.g.dart';

@freezed
class MembershipItemListModelResponse with _$MembershipItemListModelResponse {
  const factory MembershipItemListModelResponse({
    required List<MembershipItemModelResponse> membershipItemListModelResponse,
  }) = _MembershipItemListModelResponse;

  factory MembershipItemListModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$MembershipItemListModelResponseFromJson(json);
}
