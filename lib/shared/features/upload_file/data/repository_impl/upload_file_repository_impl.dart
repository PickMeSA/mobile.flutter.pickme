import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/exceptions/data_error.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/repository/upload_file_repository.dart';
import 'package:pickme/shared/services/remote/api_service/upload_file_service/upload_file_service.dart';


@Injectable(as: UploadFileRepository)
class UploadFileRepositoryImpl extends UploadFileRepository {
  UploadFileService uploadFileService;

  UploadFileRepositoryImpl({required this.uploadFileService});

  @override
  Future<UploadedFileEntity> call({UploadFileRepositoryParams? params}) async {
    try {
      return await uploadFileService.uploadFile(params: params!);
    } on DioException catch (networkException) {
      if (networkException.response?.statusCode ==
          HttpStatus.requestEntityTooLarge) {
        throw DataError("Error: Image exceeds size limit. Please upload an image less than 4MB");
      }
      rethrow;
    } catch (exception) {
      rethrow;
    }
  }
}
