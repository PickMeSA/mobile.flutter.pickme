import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: GetRemoteProfileRepository)
class GetRemoteProfileRepositoryImpl extends GetRemoteProfileRepository {
  final ProfileService profileService;
  GetRemoteProfileRepositoryImpl({
    required this.profileService
});

  @override
  Future<ProfileEntity> call({GetRemoteProfileRepositoryParams? params}) async {
    try{
      return await profileService.getRemoteProfileData();
    }catch(ex){
      rethrow;
    }
  }

}
