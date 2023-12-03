import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_skills/domain/entities/prefered_industry_list_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';


abstract class IndustryService extends PickMeCoreApi{
  IndustryService();


  Future<PreferredIndustryListEntity> getPreferredIndustryList({
    required String pageSize, required String pageNumber, required String SearchTerm
});

  Future<PreferredIndustryEntity> getPreferredIndustryEntity({
  required  String industryId
});
}