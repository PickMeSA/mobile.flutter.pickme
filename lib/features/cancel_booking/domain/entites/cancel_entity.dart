import 'package:pickme/features/cancel_booking/data/response_models/cancel_booking_model_response/cancel_booking_model_response.dart';

class CancelEntity {

  final String jobInterestId;
  final String reasonForChange;
  final String comments;

  CancelEntity({
    required this.reasonForChange,
  required this.jobInterestId,
  required this.comments});


  CancelBookingModelResponse toResponse(){
    return CancelBookingModelResponse(
        jobInterestId: jobInterestId,
        reasonForChange: reasonForChange,
        comments: comments);
}
}