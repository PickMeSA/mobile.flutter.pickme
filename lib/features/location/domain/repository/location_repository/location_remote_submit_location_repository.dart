import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

abstract class LocationRemoteSubmitLocationRepository  extends BaseRepository<LocationRemoteSubmitLocationRepositoryParams, ProfileEntity>{}

class LocationRemoteSubmitLocationRepositoryParams extends BaseRepositoryParams{
  final OTPLocationEntity otpLocationEntity;

  LocationRemoteSubmitLocationRepositoryParams({required this.otpLocationEntity});
}
