import 'package:injectable/injectable.dart';
import 'package:pickme/features/candidate_profile_page/domain/repository/get_candidate_profile_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: GetCandidateProfileRepository)
class GetCandidateProfileRepositoryImpl extends GetCandidateProfileRepository {
  final ProfileService profileService;
  GetCandidateProfileRepositoryImpl({
    required this.profileService
});

  @override
  Future<ProfileEntity> call({GetCandidateProfileRepositoryParams? params}) async {
    try{
      return await profileService.getRemoteProfileData();
    }catch(ex){
      rethrow;
    }
  }

}
