part of 'edit_qualification_details_bloc.dart';
 @immutable
abstract class EditQualificationDetailsPageEvent extends BaseEvent {}

class GetPageInformationEvent extends EditQualificationDetailsPageEvent{}

class ProfilePictureAddedEvent extends EditQualificationDetailsPageEvent{
 String filePath;

 ProfilePictureAddedEvent({required this.filePath});
}