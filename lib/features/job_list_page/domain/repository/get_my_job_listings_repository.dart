import 'package:pickme/base_classes/base_repository.dart';

import '../entities/my_job_listings_page_entity.dart';

abstract class GetMyJobListingsRepository  extends BaseRepository<GetMyJobListingsRepositoryParams, MyJobListingsPageEntity>{}

class GetMyJobListingsRepositoryParams extends BaseRepositoryParams{
  final double? lat;
  final double? lng;
  final double? maxDistance;
  final double? maxEstimatedHours;
  final double? minPrice;
  final double? maxPrice;
  final String? customerUid;
  final String? industryId;
  final String? address;
  final String? search;
  GetMyJobListingsRepositoryParams({
    this.lat,
      this.lng,
      this.maxDistance,
      this.maxEstimatedHours,
      this.minPrice,
      this.maxPrice,
      this.customerUid,
      this.industryId,
      this.address,
      this.search,
  });
  @override
  String toString() {
    return "{ lat: $lat,"
        "lng: $lng,"
        "maxDistance: $maxDistance,"
        "maxEstimatedHours: $maxEstimatedHours,"
        "minPrice: $minPrice,"
        "maxPrice: $maxPrice,"
        "customerUid: $customerUid,"
        "industryId: $industryId"
        "}";
  }
}
