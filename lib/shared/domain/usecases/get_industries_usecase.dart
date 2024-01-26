
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/repository/get_industries_repository.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart';


@Injectable()
class GetIndustriesUseCase extends BaseUseCase<GetIndustriesUseCaseParams, PaginatedIndustryEntity>{

  final GetIndustriesRepository getIndustriesRepository;

  GetIndustriesUseCase({required this.getIndustriesRepository});

  @override
  Future<PaginatedIndustryEntity> call({GetIndustriesUseCaseParams? params}) async {
   try{
     return await getIndustriesRepository.call(
         params: GetIndustriesRepositoryParams(searchText: params?.searchText??""));
   }catch(ex){
     rethrow;
   }
  }
}

class GetIndustriesUseCaseParams extends BaseUseCaseParams{
  final String searchText;
  final FilterEntity? filterEntity;
  GetIndustriesUseCaseParams({this.searchText = "", this.filterEntity});
}
