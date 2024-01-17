import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';

abstract class GetCurrentLocationRepository  extends BaseRepository<GetCurrentLocationRepositoryParams, LatLongEntity>{}

class GetCurrentLocationRepositoryParams extends BaseRepositoryParams{}
