import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banking_details_model_response.freezed.dart';
part 'banking_details_model_response.g.dart';

@freezed
class BankingDetailsModelResponse with _$BankingDetailsModelResponse {
  const factory BankingDetailsModelResponse({
    required String? name,
  }) = _BankingDetailsModelResponse;

  factory BankingDetailsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$BankingDetailsModelResponseFromJson(json);
}
