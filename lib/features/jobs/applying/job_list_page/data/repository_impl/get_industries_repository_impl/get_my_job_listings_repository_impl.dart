import 'package:injectable/injectable.dart';

import '../../../domain/entities/my_job_listings_page_entity.dart';
import '../../../domain/repository/get_my_job_listings_repository.dart';
import '../../service/get_job_listings_info/get_my_job_listings_service.dart';

@Injectable(as: GetMyJobListingsRepository)
class GetMyJobListingsRepositoryImpl extends GetMyJobListingsRepository {
  final GetMyJobListingsService getMyJobListingsService;

  GetMyJobListingsRepositoryImpl({required this.getMyJobListingsService});

  @override
  Future<MyJobListingsPageEntity> call({GetMyJobListingsRepositoryParams? params}) async{
    try{
      return await getMyJobListingsService.getMyJobListings(getMyJobListingsRepositoryParams: params!);
    }catch(ex){
      rethrow;
    }
  }

}
