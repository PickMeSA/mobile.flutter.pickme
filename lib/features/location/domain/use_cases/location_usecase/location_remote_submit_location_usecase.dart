
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

import '../../repository/location_repository/location_remote_submit_location_repository.dart';

@Injectable()
class LocationRemoteSubmitLocationUseCase extends BaseUseCase<LocationRemoteSubmitLocationUseCaseParams, ProfileEntity>{

  final LocationRemoteSubmitLocationRepository locationRemoteSubmitLocationRepository;

  LocationRemoteSubmitLocationUseCase({required this.locationRemoteSubmitLocationRepository});

  @override
  Future<ProfileEntity> call({LocationRemoteSubmitLocationUseCaseParams? params}) async {
    try{
      return await locationRemoteSubmitLocationRepository.call(
          params: LocationRemoteSubmitLocationRepositoryParams(
              otpLocationEntity: params!.otpLocationEntity));
    }catch(ex){
      rethrow;
    }
  }
}

class LocationRemoteSubmitLocationUseCaseParams extends BaseUseCaseParams{

  final OTPLocationEntity otpLocationEntity;

  LocationRemoteSubmitLocationUseCaseParams({required this.otpLocationEntity});
}
