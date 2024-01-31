
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/location/domain/repository/location_repository/get_current_device_location_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';

@Injectable()
class GetCurrentDeviceLocationUseCase extends BaseUseCase<GetCurrentDeviceLocationUseCaseParams, OTPLocationEntity>{

  final GetCurrentDeviceLocationRepository getCurrentDeviceLocationRepository;

  GetCurrentDeviceLocationUseCase({required this.getCurrentDeviceLocationRepository});

  @override
  Future<OTPLocationEntity> call({GetCurrentDeviceLocationUseCaseParams? params}) async{
   try{
     return await getCurrentDeviceLocationRepository.call();
   }catch(ex){
     rethrow;
   }
  }
}

class GetCurrentDeviceLocationUseCaseParams extends BaseUseCaseParams{}
