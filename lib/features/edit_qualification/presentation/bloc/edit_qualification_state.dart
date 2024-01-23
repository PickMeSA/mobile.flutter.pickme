part of 'edit_qualification_bloc.dart';
@immutable
abstract class EditQualificationPageState extends BaseState {
  String? error;

  EditQualificationPageState({this.error});
}

class EditQualificationPageInitState extends EditQualificationPageState  {}



class EditQualificationAddWorkState extends EditQualificationPageState{

}

class SubmitQualificationStatus extends EditQualificationPageState{
  SubmitQualificationStatus({super.error});
}