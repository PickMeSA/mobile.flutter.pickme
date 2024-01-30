
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/create_job_page_job_entity.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';

import '../repository/create_job_listing_repository.dart';


@Injectable()
class CreateJobListingUseCase extends BaseUseCase<CreateJobListingUseCaseParams, JobEntity>{

  final CreateJobListingRepository createJobListingRepository;

  CreateJobListingUseCase({required this.createJobListingRepository});

  @override
  Future<JobEntity> call({CreateJobListingUseCaseParams? params}) async {
    try{
      return await createJobListingRepository.call(
          params: CreateJobListingRepositoryParams(jobEntity: params!.jobEntity));
    }catch(ex){
      rethrow;
    }
  }
}

class CreateJobListingUseCaseParams extends BaseUseCaseParams{
  final CreateJobPageJobEntity jobEntity;
  CreateJobListingUseCaseParams({required this.jobEntity});
}
