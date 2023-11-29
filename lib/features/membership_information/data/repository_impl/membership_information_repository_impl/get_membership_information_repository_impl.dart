import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/membership_information/data/service/remote/membership_details_service.dart';
import 'package:pickme/features/membership_information/domain/membership_information_entity.dart';
import 'package:pickme/features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart';

@Injectable(as: GetMembershipInformationRepository)
class GetMembershipInformationRepositoryImpl extends GetMembershipInformationRepository {
  final MembershipDetailsService membershipDetailsService;
  GetMembershipInformationRepositoryImpl({required this.membershipDetailsService});

  @override
  Future<List<MembershipInformationEntity>> call({GetMembershipInformationRepositoryParams? params}) async {
    try{
      return await membershipDetailsService.getMembershipInformationEntity();
    }catch(ex){
      rethrow;
    }
  }

}
