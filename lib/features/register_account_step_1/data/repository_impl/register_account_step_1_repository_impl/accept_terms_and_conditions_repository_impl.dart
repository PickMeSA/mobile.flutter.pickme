import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/register_account_step_1/domain/repository/register_account_step_1_repository/accept_terms_and_conditions_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: AcceptTermsAndConditionsRepository)
class AcceptTermsAndConditionsRepositoryImpl extends AcceptTermsAndConditionsRepository {
  final ProfileService profileService;
  AcceptTermsAndConditionsRepositoryImpl({required this.profileService});

  @override
  Future<ProfileEntity> call({AcceptTermsAndConditionsRepositoryParams? params}) async{
   try{
     return await profileService.submitAcceptTermsAndConditions();
   }catch(ex){
     rethrow;
   }
  }

}
