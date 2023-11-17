part of 'add_qualification_bloc.dart';
@immutable
abstract class AddQualificationPageState extends BaseState {
  List<DropdownMenuEntry<Qualifications>>? entries = [];

  AddQualificationPageState({this.entries});
}

class AddQualificationPageInitState extends AddQualificationPageState  {}

class GetPageInformationState extends AddQualificationPageState{

  GetPageInformationState({required super.entries});
}

