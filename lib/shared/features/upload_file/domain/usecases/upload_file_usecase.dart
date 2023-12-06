import 'package:injectable/injectable.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/repository/upload_file_repository.dart';

@Injectable()
class UploadFileUseCase extends BaseUseCase<UploadFileUseCaseParams, UploadedFileEntity>{
  final UploadFileRepository uploadFileRepository;

  UploadFileUseCase({required this.uploadFileRepository});
  @override
  Future<UploadedFileEntity> call({UploadFileUseCaseParams? params}) async{
    try{
      return await uploadFileRepository.call(params: UploadFileRepositoryParams(filePath:params!.filePath));
    }catch(ex){
      rethrow;
    }
  }
}

class UploadFileUseCaseParams extends BaseUseCaseParams{
  final String filePath;

  UploadFileUseCaseParams({required this.filePath});
}