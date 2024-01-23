import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/rate_and_work_times/domain/repository/rate_and_work_times_repository/submit_remote_rate_and_work_times_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: SubmitRemoteRateAndWorkTimesRepository)
class SubmitRemoteRateAndWorkTimesRepositoryImpl extends SubmitRemoteRateAndWorkTimesRepository {
    final ProfileService profileService;
  SubmitRemoteRateAndWorkTimesRepositoryImpl({
      required this.profileService
});

  @override
  Future<ProfileEntity> call({SubmitRemoteRateAndWorkTimesRepositoryParams? params}) async {
    try{
      return await profileService.submitRemoteRateAndWorkTimes(ratesAndWorkTimesEntity: params!.ratesAndWorkTimesEntity);
    }catch(ex){
      rethrow;
    }
  }

}
