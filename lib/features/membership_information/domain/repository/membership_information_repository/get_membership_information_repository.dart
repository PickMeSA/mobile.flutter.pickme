import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/membership_information/entities/membership_information_entity.dart';

abstract class GetMembershipInformationRepository  extends BaseRepository<GetMembershipInformationRepositoryParams, List<MembershipInformationEntity>>{}

class GetMembershipInformationRepositoryParams extends BaseRepositoryParams{}
