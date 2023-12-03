
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/rates_and_work_times_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/repository/rate_and_work_times_repository/submit_remote_rate_and_work_times_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

@Injectable()
class SubmitRemoteRateAndWorkTimesUseCase extends BaseUseCase<SubmitRemoteRateAndWorkTimesUseCaseParams, ProfileEntity>{

  final SubmitRemoteRateAndWorkTimesRepository submitRemoteRateAndWorkTimesRepository;

  SubmitRemoteRateAndWorkTimesUseCase({required this.submitRemoteRateAndWorkTimesRepository});

  @override
  Future<ProfileEntity> call({SubmitRemoteRateAndWorkTimesUseCaseParams? params}) {
    try{
      return submitRemoteRateAndWorkTimesRepository.call(
          params:SubmitRemoteRateAndWorkTimesRepositoryParams(ratesAndWorkTimesEntity: params!.ratesAndWorkTimesEntity) );
    }catch(ex){
      rethrow;
    }
  }
}

class SubmitRemoteRateAndWorkTimesUseCaseParams extends BaseUseCaseParams{
  final RatesAndWorkTimesEntity ratesAndWorkTimesEntity;

  SubmitRemoteRateAndWorkTimesUseCaseParams({required this.ratesAndWorkTimesEntity});
}
