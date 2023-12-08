import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/models/candidate_profile/candidate_profile_model_response.dart';
import 'package:pickme/shared/models/pagination/data/response_models/pagination_model_response/pagination_model_response.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/candidates_service/candidates_service.dart';


// @Singleton(as: IndustryService)
class CandidateProfilesImpl extends CandidatesService{

  final ApiService apiService;

  CandidateProfilesImpl({required this.apiService });

  @override
  Future<PaginatedCandidateProfileEntity> getPaginatedCandidateProfiles() async {
    try {
      Response<dynamic> response = await
      apiService.get("$baseUrl/api/$version/industries");
      if(response.statusCode == 200) {
        
        List<CandidateProfileModelResponse> candidatesModelResponseList = (json.decode(response.data["data"]) as List)
            .map((data) => CandidateProfileModelResponse.fromJson(data))
            .toList();
        PaginationModelResponse paginationModelResponse = PaginationModelResponse.fromJson(response.data["pagination"]);

        List<CandidateProfileEntity> candidateProfileList = candidatesModelResponseList.map((profile) => CandidateProfileEntity(
            id: profile.id,
            fullName: profile.name,
            jobTitle: profile.job_title,
            hourlyRate: profile.hourly_rate,
          rating: profile.rating,
          profilePicture: profile.profile_picture
        )
        ).toList();
        PaginationEntity paginationEntity = PaginationEntity(
            pageSize: paginationModelResponse.pageSize,
            pageNumber: paginationModelResponse.pageNumber,
            total: paginationModelResponse.total,
            totalPages: paginationModelResponse.totalPages,
            nextPage: paginationModelResponse.next_page,
            prevPage: paginationModelResponse.prev_page,
            searchTerm: paginationModelResponse.searchTerm);
        return PaginatedCandidateProfileEntity(pagination: paginationEntity, candidates: candidateProfileList);
      }
      throw ("An error occurred");
    }catch(ex){
      rethrow;
    }

  }




}