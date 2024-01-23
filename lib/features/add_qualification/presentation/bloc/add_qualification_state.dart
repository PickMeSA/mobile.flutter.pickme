part of 'add_qualification_bloc.dart';
@immutable
abstract class AddQualificationPageState extends BaseState {
  String? error;
  List<DropdownMenuEntry<Qualifications>>? entries = [];

  AddQualificationPageState({this.entries, this.error});
}

class AddQualificationPageInitState extends AddQualificationPageState  {}

class GetPageInformationState extends AddQualificationPageState{

  GetPageInformationState({required super.entries});
}


class ProfilePictureAddedState extends AddQualificationPageState{


  ProfilePictureAddedState({super.error});
}
