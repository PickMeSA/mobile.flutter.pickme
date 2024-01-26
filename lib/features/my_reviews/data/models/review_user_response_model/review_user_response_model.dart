import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_user_response_model.freezed.dart';
part 'review_user_response_model.g.dart';

@freezed
class ReviewUserModelResponse with _$ReviewUserModelResponse {
  const factory ReviewUserModelResponse({
    required String userId,
    required String firstName,
    required String surname,
    required String? profilePictureUrl,
  }) = _ReviewUserModelResponse;

  factory ReviewUserModelResponse.fromJson(
      Map<String, Object?> json) =>
      _$ReviewUserModelResponseFromJson(json);
}
