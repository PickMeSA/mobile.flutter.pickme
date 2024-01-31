import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

import '../../../shared/services/remote/api_service/jobs_service/jobs_service.dart';
import '../domain/repository/remove_match_repository.dart';

@Injectable(as: RemoveMatchRepository)
class RemoveMatchRepositoryImpl extends RemoveMatchRepository {
  final JobService jobService;
  RemoveMatchRepositoryImpl({
    required this.jobService
  });

  @override
  Future<bool> call({RemoveMatchRepositoryParams? params}) async {
    try{
      return await jobService.removePotentialMatches(jobId: params!.jobId,commaSeparatedIds: params.userIds);
    }catch(ex){
      rethrow;
    }
  }

}
