import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model_response.freezed.dart';
part 'customer_model_response.g.dart';

@freezed
class CustomerModelResponse with _$CustomerModelResponse {
  const factory CustomerModelResponse({
     String? id,
     String? firstName,
     String? surname,
     String? profileImage,
     String? address
  }) = _CustomerModelResponse;

  factory CustomerModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$CustomerModelResponseFromJson(json);
}
