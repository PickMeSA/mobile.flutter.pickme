
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart';

@Injectable()
class GetRemoteProfileUseCase extends BaseUseCase<GetRemoteProfileUseCaseParams, ProfileEntity>{

  final GetRemoteProfileRepository getRemoteProfileRepository;

  GetRemoteProfileUseCase({required this.getRemoteProfileRepository});

  @override
  Future<ProfileEntity> call({GetRemoteProfileUseCaseParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetRemoteProfileUseCaseParams extends BaseUseCaseParams{}
