import 'package:pickme/shared/remote/PickMeApiCore.dart';
import 'package:pickme/shared/domain/entities/my_job_listings_page_entity.dart';




abstract class GetMyJobListingsService extends PickMeCoreApi{
  GetMyJobListingsService();

  Future<MyJobListingsPageEntity> getMyJobListings();
}