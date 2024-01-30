import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

abstract class GetCandidateProfileRepository  extends BaseRepository<GetCandidateProfileRepositoryParams, ProfileEntity>{}

class GetCandidateProfileRepositoryParams extends BaseRepositoryParams{
  final String id;
  GetCandidateProfileRepositoryParams({required this.id});
}
