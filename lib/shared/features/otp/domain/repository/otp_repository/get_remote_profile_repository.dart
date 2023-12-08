import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

abstract class GetRemoteProfileRepository  extends BaseRepository<GetRemoteProfileRepositoryParams, ProfileEntity>{}

class GetRemoteProfileRepositoryParams extends BaseRepositoryParams{}
