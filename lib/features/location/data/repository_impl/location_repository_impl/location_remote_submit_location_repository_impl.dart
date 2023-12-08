import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/location/domain/repository/location_repository/location_remote_submit_location_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: LocationRemoteSubmitLocationRepository)
class LocationRemoteSubmitLocationRepositoryImpl extends LocationRemoteSubmitLocationRepository {
    final ProfileService profileService;
  LocationRemoteSubmitLocationRepositoryImpl({required this.profileService});

  @override
  Future<ProfileEntity> call({LocationRemoteSubmitLocationRepositoryParams? params}) {
    try{
      return profileService.submitRemoteLocation(otpLocationEntity: params!.otpLocationEntity);
    }catch(ex){
      rethrow;
    }
  }

}
