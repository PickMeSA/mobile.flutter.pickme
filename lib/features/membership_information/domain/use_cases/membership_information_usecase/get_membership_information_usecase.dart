
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/membership_information/domain/membership_information_entity.dart';
import 'package:pickme/features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart';

@Injectable()
class GetMembershipInformationUseCase extends BaseUseCase<GetMembershipInformationUseCaseParams, List<MembershipInformationEntity>>{

  final GetMembershipInformationRepository getMembershipInformationRepository;

  GetMembershipInformationUseCase({required this.getMembershipInformationRepository});

  @override
  Future<List<MembershipInformationEntity>> call({GetMembershipInformationUseCaseParams? params}) {
    try{
      return getMembershipInformationRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class GetMembershipInformationUseCaseParams extends BaseUseCaseParams{}
