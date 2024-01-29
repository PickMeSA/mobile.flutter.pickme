import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/repository/get_industries_repository.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/industries_service/industry_service.dart';

// @Singleton(as: IndustryService)
class IndustryServiceMockImpl extends IndustryService{

  final ApiService apiService;

  IndustryServiceMockImpl({required this.apiService});

  @override
  Future<PaginatedIndustryEntity> getIndustries({GetIndustriesServiceParams? params}) async {

        List<IndustryEntity> industryEntityList = [
         IndustryEntity(id: 1,industry: "HandyMan"),
         IndustryEntity(id: 2,industry: "Electricians"),
         IndustryEntity(id: 3,industry: "Painters"),
         IndustryEntity(id: 4,industry: "Plumbers"),
         IndustryEntity(id: 5,industry: "Tutor"),
         IndustryEntity(id: 6,industry: "Tutor"),
        ];
        PaginationEntity paginationEntity = PaginationEntity(
            pageSize: 10,
            pageNumber: 1,
            total: industryEntityList.length,
            totalPages: industryEntityList.length~/10 + (industryEntityList.length%10),
            nextPage: null,
            prevPage: null,
            searchTerm: ""
        );
        return Future.value(PaginatedIndustryEntity(pagination: paginationEntity, industries: industryEntityList));
      }
  }