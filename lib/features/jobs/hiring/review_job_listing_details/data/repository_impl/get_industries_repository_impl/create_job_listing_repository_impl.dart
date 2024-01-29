import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/services/remote/api_service/create_job_listing_service/create_job_listing_service.dart';

import '../../../domain/repository/create_job_listing_repository.dart';

@Injectable(as: CreateJobListingRepository)
class CreateJobListingRepositoryImpl extends CreateJobListingRepository {
  final CreateJobListingService createJobService;

  CreateJobListingRepositoryImpl({required this.createJobService});

  @override
  Future<JobEntity> call({CreateJobListingRepositoryParams? params}) async{
    try{
      return await createJobService.createJob(jobListingRepositoryParams: params!);
    }catch(ex){
      rethrow;
    }
  }

}
