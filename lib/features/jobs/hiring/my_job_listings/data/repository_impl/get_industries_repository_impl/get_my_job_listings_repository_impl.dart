import 'package:injectable/injectable.dart';

import '../../../../../../../shared/services/remote/api_service/get_job_listings_info/get_my_job_listings_service.dart';
import '../../../../../shared/domain/entities/my_job_listings_page_entity.dart';
import '../../../../../shared/domain/repositories/get_my_job_listings_repository.dart';

@Injectable(as: GetMyJobListingsRepository)
class GetMyJobListingsRepositoryImpl extends GetMyJobListingsRepository {
  final GetMyJobListingsService getMyJobListingsService;

  GetMyJobListingsRepositoryImpl({required this.getMyJobListingsService});

  @override
  Future<MyJobListingsPageEntity> call({GetMyJobListingsRepositoryParams? params}) async{
    try{
      return await getMyJobListingsService.getMyJobListings();
    }catch(ex){
      rethrow;
    }
  }

}
