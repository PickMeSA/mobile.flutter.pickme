import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class SendJobOfferService extends PickMeCoreApi{
  SendJobOfferService();

  Future<bool> sendOffer({required JobEntity job, required CandidateProfileEntity candidateProfileEntity});
}