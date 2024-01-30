import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_data_model_response.freezed.dart';
part 'job_data_model_response.g.dart';

@freezed
class JobDataModel with _$JobDataModel {
  const factory JobDataModel({
    required String title,
    String? address,
  }) = _JobDataModel;

  factory JobDataModel.fromJson(Map<String, dynamic> json) =>
      _$JobDataModelFromJson(json);
}
