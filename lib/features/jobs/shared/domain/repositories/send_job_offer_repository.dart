import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/jobs/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';

abstract class SendJobOfferRepository  extends BaseRepository<SendJobOfferRepositoryParams, bool>{}

class SendJobOfferRepositoryParams extends BaseRepositoryParams{
  final JobEntity jobEntity;
  final CandidateProfileEntity candidateProfileEntity;
  SendJobOfferRepositoryParams({required this.candidateProfileEntity, required this.jobEntity});
}
