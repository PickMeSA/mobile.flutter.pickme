import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';

abstract class GetCurrentDeviceLocationRepository  extends BaseRepository<GetCurrentDeviceLocationRepositoryParams, OTPLocationEntity>{}

class GetCurrentDeviceLocationRepositoryParams extends BaseRepositoryParams{}
