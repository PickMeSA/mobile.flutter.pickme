part of 'final_details_bloc.dart';
 @immutable
abstract class FinalDetailsPageEvent extends BaseEvent {}

class ProfilePictureAddedEvent extends FinalDetailsPageEvent{
  final String filePath;
  ProfilePictureAddedEvent({required this.filePath});
}
class PoliceClearanceAddedEvent extends FinalDetailsPageEvent{
  final String filePath;
  PoliceClearanceAddedEvent({required this.filePath});
}
class SubmitClickedEvent extends FinalDetailsPageEvent{
  final String description;
  SubmitClickedEvent({required this.description});
}
class ActivatePurchaseEvent extends FinalDetailsPageEvent {
  final InAppPurchaseDetails purchaseDetails;
  ActivatePurchaseEvent(this.purchaseDetails);
}