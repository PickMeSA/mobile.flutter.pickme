import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/repository/get_paginated_candidates_repository.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/models/candidate_profile/candidate_profile_model_response.dart';
import 'package:pickme/shared/models/pagination/data/response_models/pagination_model_response/pagination_model_response.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/candidates_service/candidates_service.dart';


@Singleton(as: CandidatesService)
class CandidateProfilesImpl extends CandidatesService{

  final ApiService apiService;

  CandidateProfilesImpl({required this.apiService });

  @override
  Future<PaginatedCandidateProfileEntity> getPaginatedCandidateProfiles(GetPaginatedCandidatesByIndustryRepositoryParams? params) async {
    try {
      Response<dynamic> response = await
      apiService.get("${baseUrl}$version/profiles${params!.toQueryString()}");
      if(response.statusCode == 200) {
        var decoded = (response.data["data"]);
        List<CandidateProfileModelResponse> candidatesModelResponseList = [];
      decoded
            .forEach((data){
              logger.i(data);
              candidatesModelResponseList.add(CandidateProfileModelResponse(
                id: data["id"].toString(),
                userId: data["userId"],
                firstName: data["firstName"],
                surname: data["surname"],
                description: data["description"],
                rating: data["rating"],
                jobTitle: data["jobTitle"],
                hourlyRate: double.parse(data["hourlyRate"].toString()),
                profilePictureUrl: data["profilePictureUrl"],
              ));
            });
        PaginationModelResponse paginationModelResponse = PaginationModelResponse.fromJson(response.data["pagination"]);

        List<CandidateProfileEntity> candidateProfileList = candidatesModelResponseList.map((profile) => CandidateProfileEntity(
            id: profile.userId,
            skills: profile.skills,
            photos: profile.photos,
            workExperience: profile.workExperience?.map((e) => WorkExperienceEntity(name: e.role, institutionName: e.company, period: e.period)).toList(),
            about: profile.description,
            fullName: "${profile.firstName} ${profile.surname}",
            jobTitle: profile.jobTitle,
            hourlyRate: profile.hourlyRate,
          rating: profile.rating,
          profilePicture: profile.profilePictureUrl
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
      throw ("A server error occurred");
    }catch(ex){
      rethrow;
    }

  }




}