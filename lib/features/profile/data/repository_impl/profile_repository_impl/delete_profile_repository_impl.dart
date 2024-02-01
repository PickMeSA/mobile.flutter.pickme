import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/profile/domain/repository/profile_repository/delete_profile_repository.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: DeleteProfileRepository)
class DeleteProfileRepositoryImpl extends DeleteProfileRepository {
  final ProfileService profileService;
  DeleteProfileRepositoryImpl({required this.profileService});

  @override
  Future<bool> call({DeleteProfileRepositoryParams? params}) async{
   try{
     return await profileService.deleteProfile();
   }catch(ex){
     rethrow;
   }
  }

}
