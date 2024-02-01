import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'labourer_model_response.freezed.dart';
part 'labourer_model_response.g.dart';

@freezed
class LabourerModelResponse with _$LabourerModelResponse {
  const factory LabourerModelResponse({
    required String? id,
    required String? firstName,
    required String? surname,
    required double? averageRating,
    required String? profileImage,
    required String? address
  }) = _LabourerModelResponse;

  factory LabourerModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$LabourerModelResponseFromJson(json);
}
