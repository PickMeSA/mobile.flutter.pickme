part of 'edit_qualification_bloc.dart';
 @immutable
abstract class EditQualificationPageEvent extends BaseEvent {}

class EditQualificationAddQualificationEvent extends EditQualificationPageEvent{
}

class SubmitQualificationEvent extends EditQualificationPageEvent{

 final ProfileEntity profileEntity;

 SubmitQualificationEvent({required this.profileEntity});
}
