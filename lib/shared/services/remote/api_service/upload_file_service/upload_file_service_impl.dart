import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/features/upload_file/data/models/upload_file_response/upload_file_response.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/repository/upload_file_repository.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/upload_file_service/upload_file_service.dart';

@Injectable(as: UploadFileService)
class UploadFileServiceImpl extends UploadFileService{
  final ApiService apiService;

  UploadFileServiceImpl({required this.apiService});

  @override
  Future<UploadedFileEntity> uploadFile({required UploadFileRepositoryParams params}) async{
    try{
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          params.filePath,
          filename: params.filePath.split('/').last,
        ),
        // Add other form fields if needed
        'name': params.filePath.split('/').last,
      });
      Response response = await apiService.post("$baseUrl$version/files", data: formData);
      UploadFileResponse uploadFileResponse = UploadFileResponse.fromJson(response.data);
      return UploadedFileEntity(id: uploadFileResponse.id, url: uploadFileResponse.url, ref: uploadFileResponse.ref);
    }catch(ex){
      logger.e(ex);
      rethrow;
    }
  }
}