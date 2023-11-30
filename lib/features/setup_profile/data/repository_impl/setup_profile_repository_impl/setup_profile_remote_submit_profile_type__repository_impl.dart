import 'package:dio/dio.dart';
import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: SetupProfileRemoteSubmitProfileTypeRepository)
class SetupProfileRemoteSubmitProfileTypeRepositoryImpl extends SetupProfileRemoteSubmitProfileTypeRepository {
  final ProfileService profileService;
  SetupProfileRemoteSubmitProfileTypeRepositoryImpl({required this.profileService});

  @override
  Future<bool> call({SetupProfileRemoteSubmitProfileTypeRepositoryParams? params}) async {
   try{
     return await profileService.submitProfileType(params!.profileTypeEntity);

   }catch(ex){
     rethrow;
   }
  }

}
