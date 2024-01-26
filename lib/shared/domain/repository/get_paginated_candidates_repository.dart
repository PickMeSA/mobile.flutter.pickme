import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';

abstract class GetPaginatedCandidatesByIndustryRepository  extends BaseRepository<GetPaginatedCandidatesByIndustryRepositoryParams, PaginatedCandidateProfileEntity>{}

class GetPaginatedCandidatesByIndustryRepositoryParams extends BaseRepositoryParams{
  final int? pageNumber;
  final int? pageSize;
  final double? maxDistance;
  final double? minHourlyRate;
  final double? maxHourlyRate;
  final int? minRating;
  final String? industryId;
  GetPaginatedCandidatesByIndustryRepositoryParams({
    this.pageNumber,
    this.pageSize,
    this.maxDistance,
    this.minHourlyRate,
    this.maxHourlyRate,
    this.minRating,
    this.industryId,
  });

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {};
    if(pageNumber!=null){
      map["pageNumber"] = pageNumber.toString();
    }
    if(pageSize!=null){
      map["pageSize"] = pageSize.toString();
    }
    if(maxDistance!=null){
      map["maxDistance"] = maxDistance.toString();
    }
    if(minHourlyRate!=null){
      map["minHourlyRate"] = minHourlyRate.toString();
    }
    if(maxHourlyRate!=null){
      map["maxHourlyRate"] = maxHourlyRate.toString();
    }
    if(minRating!=null){
      map["minRating"] = minRating.toString();
    }
    if(industryId!=null){
      map["industryId"] = industryId.toString();
    }
    return map;
  }
  String toQueryString(){
    String map = "?";
    if(pageNumber!=null){
      map += "&pageNumber=${pageNumber.toString()}";
    }
    if(pageSize!=null){
      map += "&pageSize=${pageSize.toString()}";
    }
    if(maxDistance!=null){
      map += "&maxDistance=${maxDistance.toString()}";
    }
    if(minHourlyRate!=null){
      map += "&minHourlyRate=${minHourlyRate.toString()}";
    }
    if(maxHourlyRate!=null){
      map += "&maxHourlyRate=${maxHourlyRate.toString()}";
    }
    if(minRating!=null){
      map += "&minRating=${minRating.toString()}";
    }
    if(industryId!=null){
      map += "&industryId=${industryId.toString()}";
    }
    return map;
  }
}
