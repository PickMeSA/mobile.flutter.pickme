import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class CandidatesService extends  PickMeCoreApi{
  CandidatesService({required super.tokenLocalStorage});

  Future<PaginatedCandidateProfileEntity> getPaginatedCandidateProfiles();
}
