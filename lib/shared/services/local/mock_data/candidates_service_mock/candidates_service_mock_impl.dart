import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';

import '../../../remote/api_service/candidates_service/candidates_service.dart';

@Singleton(as: CandidatesService)
class CandidatesServiceMock extends CandidatesService{

  final ApiService apiService;

  CandidatesServiceMock({required this.apiService ,required super.tokenLocalStorage});

  @override
  Future<PaginatedCandidateProfileEntity> getPaginatedCandidateProfiles() async {

    List<CandidateProfileEntity> candidateProfileList = [
      const CandidateProfileEntity(
        id: "1",
        fullName: "Andrew Sithole",
        jobTitle: 'Handy man',
        hourlyRate: 40,
        rating: 4,
        profilePicture: "https://images.unsplash.com/photo-1570158268183-d296b2892211?q=80&w=3456&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ),
      const CandidateProfileEntity(
          id: "2",
          fullName: "Freedom Mathebula",
        jobTitle: 'Flutter engineer',
        rating: 3,
        hourlyRate: 30,
        profilePicture: "https://images.unsplash.com/photo-1664575600796-ffa828c5cb6e?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ),
      const CandidateProfileEntity(
          id: "2",
          fullName: "Thulane Khumalo",
        jobTitle: 'Backend engineer',
        rating: 3,
        hourlyRate: 30,
        profilePicture: "https://images.unsplash.com/flagged/photo-1577605047476-202951cec757?q=80&w=2912&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ),
      const CandidateProfileEntity(
          id: "2",
          fullName: "Ruan Botha",
        jobTitle: 'Miner',
        rating: 3,
        hourlyRate: 80,
        profilePicture: "https://plus.unsplash.com/premium_photo-1663050931089-6ad2058e5020?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      ),
      const CandidateProfileEntity(
          id: "2",
          fullName: "Zaahidah",
        jobTitle: 'Boss',
        rating: 3,
        hourlyRate: 80,
      ),
    ];
    PaginationEntity paginationEntity = PaginationEntity(
        pageSize: 10,
        pageNumber: 1,
        total: candidateProfileList.length,
        totalPages: candidateProfileList.length~/10 + (candidateProfileList.length%10),
        nextPage: null,
        prevPage: null,
        searchTerm: ""
    );
    return Future.value(PaginatedCandidateProfileEntity(pagination: paginationEntity, candidates: candidateProfileList));
  }




}