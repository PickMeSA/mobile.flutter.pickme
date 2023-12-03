import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/models/industries/data/response_models/industries_model_response/industries_model_response.dart';
import 'package:pickme/shared/models/pagination/data/response_models/pagination_model_response/pagination_model_response.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/industries_service/industry_service.dart';

@Singleton(as: IndustryService)
class IndustryServiceImpl extends IndustryService {
  final ApiService apiService;
  final Logger logger = Logger();

  IndustryServiceImpl(
      {required this.apiService, required super.tokenLocalStorage});

  @override
  Future<PaginatedIndustryEntity> getIndustries() async {
    try {
      // todo: Implement a caching functionality
      // if(boxSyncData.isNotEmpty){
      //   String? savedPaginatedIndustriesJson = boxSyncData.get('paginatedIndustries');
      //   if(savedPaginatedIndustriesJson != null){
      //     PaginatedIndustryEntity hivePaginatedIndustryEntity = json.decode(savedPaginatedIndustriesJson);
      //     if(hivePaginatedIndustryEntity.pagination.lastUpdated!.isAfter(DateTime.now().add(const Duration(days:-1)))) {
      //       logger.i("returning saved industries");
      //       return hivePaginatedIndustryEntity;
      //     }
      //   }
      // }
      Response<dynamic> response =
          await apiService.get("$baseUrl$version/industries");
      if (response.statusCode == 200) {
        List<IndustriesModelResponse> industryModelResponseList = [];
        for (var element in response.data["data"]) {
          industryModelResponseList
              .add(IndustriesModelResponse.fromJson(element));
        }
        PaginationModelResponse paginationModelResponse =
            PaginationModelResponse.fromJson(response.data["pagination"]);

        List<IndustryEntity> industryEntityList = industryModelResponseList
            .map((e) => IndustryEntity(id: e.id, industry: e.industry))
            .toList();
        PaginationEntity paginationEntity = PaginationEntity(
            pageSize: paginationModelResponse.pageSize,
            pageNumber: paginationModelResponse.pageNumber,
            total: paginationModelResponse.total,
            totalPages: paginationModelResponse.totalPages,
            nextPage: paginationModelResponse.next_page,
            prevPage: paginationModelResponse.prev_page,
            searchTerm: paginationModelResponse.searchTerm,
          lastUpdated: DateTime.now()
        );
        PaginatedIndustryEntity paginatedIndustryEntity = PaginatedIndustryEntity(
            pagination: paginationEntity, industries: industryEntityList);

        // boxSyncData.put('paginatedIndustries', (paginatedIndustryEntity));

        return paginatedIndustryEntity;
      }
      throw ("An error occurred");
    } catch (ex) {
      logger.e(ex);
      rethrow;
    }
  }
}
