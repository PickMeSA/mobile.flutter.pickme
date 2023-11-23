import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/models/industries/data/response_models/industries_model_response/industries_model_response.dart';
import 'package:pickme/shared/models/pagination/data/response_models/pagination_model_response/pagination_model_response.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/industries_service/industry_service.dart';

// @Singleton(as: IndustryService)
class IndustryServiceImpl extends IndustryService{

  final ApiService apiService;

  IndustryServiceImpl({required this.apiService ,required super.tokenLocalStorage});

  @override
  Future<PaginatedIndustryEntity> getIndustries() async {
    try {
      Response<dynamic> response = await
      apiService.get("$baseUrl/api/$version/industries");
      if(response.statusCode == 200) {
        
        List<IndustriesModelResponse> industryModelResponseList = (json.decode(response.data["data"]) as List)
            .map((data) => IndustriesModelResponse.fromJson(data))
            .toList();
        PaginationModelResponse paginationModelResponse = PaginationModelResponse.fromJson(response.data["pagination"]);

        List<IndustryEntity> industryEntityList = industryModelResponseList.map((e) => IndustryEntity(id: e.id!,industry: e.industry!)).toList();
        PaginationEntity paginationEntity = PaginationEntity(
            pageSize: paginationModelResponse.pageSize,
            pageNumber: paginationModelResponse.pageNumber,
            total: paginationModelResponse.total,
            totalPages: paginationModelResponse.totalPages,
            nextPage: paginationModelResponse.next_page,
            prevPage: paginationModelResponse.prev_page,
            searchTerm: paginationModelResponse.searchTerm);
        return PaginatedIndustryEntity(pagination: paginationEntity, industries: industryEntityList);
      }
      throw ("An error occurred");
    }catch(ex){
      rethrow;
    }

  }




}