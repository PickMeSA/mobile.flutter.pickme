import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class IndustryService extends  PickMeCoreApi{
  IndustryService({required super.tokenLocalStorage});

  Future<PaginatedIndustryEntity> getIndustries();
}
