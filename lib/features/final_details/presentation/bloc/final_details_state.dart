part of 'final_details_bloc.dart';
@immutable
abstract class FinalDetailsPageState extends BaseState {
  String? error;

  FinalDetailsPageState({ this.error});
}

class FinalDetailsPageInitState extends FinalDetailsPageState  {

}
class ProfilePictureAddedState extends FinalDetailsPageState  {}
class PoliceClearanceAddedState extends FinalDetailsPageState  {}
class SubmitClickedState extends FinalDetailsPageState  {
  final ProfileEntity? profileEntity;

  SubmitClickedState({ this.profileEntity, super.error});
}

class UpdatePurchaseDetailsState extends FinalDetailsPageState {
  final String? error;
  final InAppResponseActivationResultDetails? activationResultDetails;
  UpdatePurchaseDetailsState({this.error, this.activationResultDetails});
}