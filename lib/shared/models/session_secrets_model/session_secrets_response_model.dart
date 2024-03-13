import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_secrets_response_model.freezed.dart';
part 'session_secrets_response_model.g.dart';

@freezed
class SessionSecretsResponseModel with _$SessionSecretsResponseModel {
  factory SessionSecretsResponseModel({
    @JsonKey(name: 'session-id') required String sessionId,
    required int ttl,
  }) = _SessionSecretsResponseModel;

  factory SessionSecretsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionSecretsResponseModelFromJson(json);
}
