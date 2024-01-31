import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

abstract class RemoveMatchRepository  extends BaseRepository<RemoveMatchRepositoryParams, bool>{}

class RemoveMatchRepositoryParams extends BaseRepositoryParams{
  final String jobId;
  final String userIds;
  RemoveMatchRepositoryParams({required this.jobId, required this.userIds});
}
