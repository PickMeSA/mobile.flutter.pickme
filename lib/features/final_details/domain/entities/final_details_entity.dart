import 'package:equatable/equatable.dart';
import 'package:pickme/features/final_details/data/response_models/final_details_model_response/final_details_model_response.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';

class FinalDetailsEntity extends Equatable{
  final UploadedFileEntity? profilePicture;
  final UploadedFileEntity? policeClearance;
  final String? description;
  final int? policeClearanceId;
  final int? profilePictureId;

   FinalDetailsEntity({this.policeClearanceId, this.profilePictureId,this.profilePicture, this.policeClearance, this.description});

  copyWith({String? newDescription,UploadedFileEntity? newProfilePicture, UploadedFileEntity? newPoliceClearance}){
    return FinalDetailsEntity(
        description: newDescription??description,
        profilePicture: newProfilePicture??profilePicture,
        policeClearance: newPoliceClearance?? policeClearance
    );
  }

  FinalDetailsModelResponse toResponse(){
    return FinalDetailsModelResponse(
      description: description,
      policeClearanceId: policeClearanceId,
      profilePictureId: profilePictureId
    );
  }


  @override
  List<Object?> get props => [description, profilePicture, policeClearance];
}