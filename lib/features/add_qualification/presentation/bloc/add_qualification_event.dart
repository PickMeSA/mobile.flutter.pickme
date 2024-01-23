part of 'add_qualification_bloc.dart';
 @immutable
abstract class AddQualificationPageEvent extends BaseEvent {}

class GetPageInformationEvent extends AddQualificationPageEvent{}

class ProfilePictureAddedEvent extends AddQualificationPageEvent{
  String filePath;

  ProfilePictureAddedEvent({required this.filePath});
}
