import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_error_model.freezed.dart';
part 'http_error_model.g.dart';
@freezed
abstract class HttpErrorModel with _$HttpErrorModel {
  const factory HttpErrorModel({
    required String message,
    required int code,
  }) = _HttpErrorModel;

  factory HttpErrorModel.fromJson(Map<String, dynamic> json) => _$HttpErrorModelFromJson(json);
}