import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/exceptions/data_error.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/repository/upload_file_repository.dart';
import 'package:pickme/shared/services/remote/api_service/upload_file_service/upload_file_service.dart';

import '../../../../../localization/generated/l10n.dart';


@Injectable(as: UploadFileRepository)
class UploadFileRepositoryImpl extends UploadFileRepository {
  final localization;
  final UploadFileService uploadFileService;

  UploadFileRepositoryImpl({required this.uploadFileService, required this.localization});

  @override
  Future<UploadedFileEntity> call({UploadFileRepositoryParams? params}) async {
    try {
      return await uploadFileService.uploadFile(params: params!);
    } on DioException catch (networkException) {
      if (networkException.response?.statusCode ==
          HttpStatus.requestEntityTooLarge) {
        throw DataError(localization.fileExceedsUploadableSize);
      }
      rethrow;
    } catch (exception) {
      rethrow;
    }
  }
}
