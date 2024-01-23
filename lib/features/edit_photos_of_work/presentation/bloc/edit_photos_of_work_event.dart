part of 'edit_photos_of_work_bloc.dart';
 @immutable
abstract class EditPhotosOfWorkPageEvent extends BaseEvent {}

class ProfilePictureAddedEvent extends EditPhotosOfWorkPageEvent{
 final String filePath;

 ProfilePictureAddedEvent({required this.filePath});
}

class RemoveImageClickedEvent extends EditPhotosOfWorkPageEvent{
  final int? index;

  RemoveImageClickedEvent({required this.index});
}
