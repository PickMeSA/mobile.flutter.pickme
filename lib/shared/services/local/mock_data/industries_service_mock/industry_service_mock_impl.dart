import 'package:injectable/injectable.dart';
import 'package:pickme/features/jobs/shared/domain/repositories/get_industries_repository.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/industries_service/industry_service.dart';

// @Singleton(as: IndustryService)
class IndustryServiceMockImpl extends IndustryService{

  final ApiService apiService;

  IndustryServiceMockImpl({required this.apiService ,required super.tokenLocalStorage});

  @override
  Future<PaginatedIndustryEntity> getIndustries({GetIndustriesServiceParams? params}) async {

        List<IndustryEntity> industryEntityList = [
        const IndustryEntity(id: "1",industry: "HandyMan"),
        const IndustryEntity(id: "2",industry: "Electricians"),
        const IndustryEntity(id: "3",industry: "Painters"),
        const IndustryEntity(id: "4",industry: "Plumbers"),
        const IndustryEntity(id: "5",industry: "Tutor"),
        const IndustryEntity(id: "5",industry: "Tutor"),
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