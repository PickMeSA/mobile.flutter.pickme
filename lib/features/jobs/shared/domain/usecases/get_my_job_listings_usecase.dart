
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/my_job_listings_page_entity.dart';
import '../repositories/get_my_job_listings_repository.dart';


@Injectable()
class GetMyJobListingsUseCase extends BaseUseCase<GetMyJobListingsUseCaseParams, MyJobListingsPageEntity>{

  final GetMyJobListingsRepository getMyJobListingsRepository;

  GetMyJobListingsUseCase({required this.getMyJobListingsRepository});

  @override
  Future<MyJobListingsPageEntity> call({GetMyJobListingsUseCaseParams? params}) async {
   try{
     return await getMyJobListingsRepository.call();
   }catch(ex){
     rethrow;
   }
  }
}

class GetMyJobListingsUseCaseParams extends BaseUseCaseParams{
  GetMyJobListingsUseCaseParams();
}
