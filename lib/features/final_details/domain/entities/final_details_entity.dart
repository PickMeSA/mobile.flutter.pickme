import 'package:equatable/equatable.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';

class FinalDetailsEntity extends Equatable{
  final UploadedFileEntity? profilePicture;
  final UploadedFileEntity? policeClearance;
  final String? description;

  const FinalDetailsEntity({this.profilePicture, this.policeClearance, this.description});

  copyWith({String? newDescription,UploadedFileEntity? newProfilePicture, UploadedFileEntity? newPoliceClearance}){
    return FinalDetailsEntity(
        description: newDescription??description,
        profilePicture: newProfilePicture??profilePicture,
        policeClearance: newPoliceClearance?? policeClearance
    );
  }
  @override
  List<Object?> get props => [description, profilePicture, policeClearance];
}