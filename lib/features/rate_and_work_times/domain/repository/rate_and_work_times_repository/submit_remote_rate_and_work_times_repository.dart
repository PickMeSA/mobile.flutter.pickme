import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/rates_and_work_times_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

abstract class SubmitRemoteRateAndWorkTimesRepository  extends BaseRepository<SubmitRemoteRateAndWorkTimesRepositoryParams, ProfileEntity>{}

class SubmitRemoteRateAndWorkTimesRepositoryParams extends BaseRepositoryParams{

  final RatesAndWorkTimesEntity ratesAndWorkTimesEntity;

  SubmitRemoteRateAndWorkTimesRepositoryParams({required this.ratesAndWorkTimesEntity});
}
