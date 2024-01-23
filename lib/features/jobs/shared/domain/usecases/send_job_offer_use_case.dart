
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';

import '../repositories/send_job_offer_repository.dart';

@Injectable()
class SendJobOfferUseCase extends BaseUseCase<SendJobOfferUseCaseParams, bool>{

  final SendJobOfferRepository sendJobOfferRepository;

  SendJobOfferUseCase({required this.sendJobOfferRepository});

  @override
  Future<bool> call({SendJobOfferUseCaseParams? params}) async {
   try{
     return await sendJobOfferRepository.call(params: SendJobOfferRepositoryParams(
       candidateProfileEntity: params!.candidateProfileEntity,
       jobEntity: params.jobEntity
     ));
   }catch(ex){
     rethrow;
   }
  }
}

class SendJobOfferUseCaseParams extends BaseUseCaseParams{
  final JobEntity jobEntity;
  final CandidateProfileEntity candidateProfileEntity;
  SendJobOfferUseCaseParams({required this.candidateProfileEntity, required this.jobEntity});
}
