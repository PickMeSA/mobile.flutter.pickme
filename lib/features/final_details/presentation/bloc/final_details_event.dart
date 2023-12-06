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