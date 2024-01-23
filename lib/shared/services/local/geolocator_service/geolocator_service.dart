import 'package:pickme/shared/domain/entities/lat_long_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class GeoLocatorService extends PickMeCoreApi{

  Future<LatLongEntity> getCurrentLocation();
}