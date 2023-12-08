import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/repository/upload_file_repository.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class UploadFileService extends PickMeCoreApi {
  Future<UploadedFileEntity> uploadFile({required UploadFileRepositoryParams params});
}