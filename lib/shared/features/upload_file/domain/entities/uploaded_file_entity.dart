import 'package:equatable/equatable.dart';
import 'package:pickme/shared/features/upload_file/data/models/upload_file_response/upload_file_response.dart';

class UploadedFileEntity extends Equatable{
   int? id;
   String? url;
   String? ref;

   UploadedFileEntity({required this.id, required this.url, required this.ref});

  @override
  List<Object?> get props => [id];

  int toResponse(){
    return id!;
  }

  UploadedFileEntity.fromResponse({required UploadFileResponse response}){
    url = response.url;
    id = response.id;
    ref = response.ref;

  }

}