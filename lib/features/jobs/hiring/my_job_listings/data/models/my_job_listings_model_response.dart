import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../shared/models/jobs/my_job_listings_job_model_response.dart';

part 'my_job_listings_model_response.freezed.dart';
part 'my_job_listings_model_response.g.dart';

@freezed
class MyJobListingsModelResponse with _$MyJobListingsModelResponse {
  const factory MyJobListingsModelResponse({
    required List<MyJobListingsJobModelResponse> jobs,
  }) = _MyJobListingsModelResponse;

  factory MyJobListingsModelResponse.fromJson(
          Map<String, Object?> json) =>
      _$MyJobListingsModelResponseFromJson(json);
}
