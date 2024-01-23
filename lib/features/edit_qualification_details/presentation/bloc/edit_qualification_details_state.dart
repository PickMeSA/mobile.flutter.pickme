part of 'edit_qualification_details_bloc.dart';
@immutable
abstract class EditQualificationDetailsPageState extends BaseState {
  String? error;
  List<DropdownMenuEntry<Qualifications>>? entries = [];

  EditQualificationDetailsPageState({this.error, this.entries});
}

class EditQualificationDetailsPageInitState extends EditQualificationDetailsPageState  {}

class GetPageInformationState extends EditQualificationDetailsPageState{

  GetPageInformationState({required super.entries});
}


class ProfilePictureAddedState extends EditQualificationDetailsPageState{


  ProfilePictureAddedState({super.error});
}
