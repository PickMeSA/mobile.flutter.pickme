
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/constants/default_values.dart';

import '../entities/my_job_listings_page_entity.dart';
import '../repository/get_my_job_listings_repository.dart';


@Injectable()
class GetMyJobListingsUseCase extends BaseUseCase<GetMyJobListingsUseCaseParams, MyJobListingsPageEntity>{

  final GetMyJobListingsRepository getMyJobListingsRepository;

  GetMyJobListingsUseCase({required this.getMyJobListingsRepository});

  @override
  Future<MyJobListingsPageEntity> call({GetMyJobListingsUseCaseParams? params}) async {
   try{
     return await getMyJobListingsRepository.call(params: GetMyJobListingsRepositoryParams(
         lat: params!.lat,
         lng: params.lng,
         maxDistance: params.maxDistance,
         maxEstimatedHours: params.maxEstimatedHours,
         minPrice: params.minPrice,
         maxPrice: params.maxPrice,
         customerUid: params.customerUid,
         industryId: params.industryId
     ));
   }catch(ex){
     rethrow;
   }
  }
}

class GetMyJobListingsUseCaseParams extends BaseUseCaseParams{
  final double? lat;
  final double? lng;
  final double? maxDistance;
  final double? maxEstimatedHours;
  final double? minPrice;
  final double? maxPrice;
  final String? customerUid;
  final String? industryId;
  GetMyJobListingsUseCaseParams({
    this.lat,
    this.lng,
    this.maxDistance,
    this.maxEstimatedHours,
    this.minPrice,
    this.maxPrice,
    this.customerUid,
    this.industryId
  });}
