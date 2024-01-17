
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';
import 'package:pickme/shared/domain/repository/location/get_current_location_repository.dart';

@Injectable()
class GetCurrentLocationUseCase extends BaseUseCase<GetCurrentLocationUseCaseParams, LatLongEntity>{

  final GetCurrentLocationRepository getCurrentLocationRepository;

  GetCurrentLocationUseCase({required this.getCurrentLocationRepository});

  @override
  Future<LatLongEntity> call({GetCurrentLocationUseCaseParams? params})async {
    try{
      return await getCurrentLocationRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class GetCurrentLocationUseCaseParams extends BaseUseCaseParams{}
