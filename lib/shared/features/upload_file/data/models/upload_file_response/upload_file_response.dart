import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_file_response.freezed.dart';
part 'upload_file_response.g.dart';

@freezed
class UploadFileResponse with _$UploadFileResponse {
  const factory UploadFileResponse({
    required String? url,
    required String? ref,
    required int? id,
  }) = _UploadFileResponse;

  factory UploadFileResponse.fromJson(
      Map<String, Object?> json) =>
      _$UploadFileResponseFromJson(json);
}
