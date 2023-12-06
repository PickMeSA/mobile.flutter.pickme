import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';

abstract class UploadFileRepository extends BaseRepository<UploadFileRepositoryParams, UploadedFileEntity>{

}
class UploadFileRepositoryParams extends BaseRepositoryParams{
  final String filePath;

  UploadFileRepositoryParams({required this.filePath});
}