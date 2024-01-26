part of 'edit_photos_of_work_bloc.dart';
@immutable
abstract class EditPhotosOfWorkPageState extends BaseState {
  String? error;

  EditPhotosOfWorkPageState({this.error});
}

class EditPhotosOfWorkPageInitState extends EditPhotosOfWorkPageState  {}

class ProfilePictureAddedState extends EditPhotosOfWorkPageState{
  UploadedFileEntity? uploadFileEntity;
  ProfilePictureAddedState({this.uploadFileEntity,super.error});


}


class RemoveImageClickedState extends EditPhotosOfWorkPageState{
  final int? index;

  RemoveImageClickedState({required this.index});
}