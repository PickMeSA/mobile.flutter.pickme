import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_reviews/data/models/paginated_reviews_response/my_reviews_page_model_response.dart';
import 'package:pickme/features/my_reviews/data/service/get_my_reviews_page_entity_service.dart';
import 'package:pickme/features/my_reviews/domain/entities/my_reviews_page_entity.dart';
import 'package:pickme/features/my_reviews/domain/repository/get_my_reviews_page_entity_repository.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/domain/entities/review_entity.dart';
import 'package:pickme/shared/domain/entities/review_user_entity.dart';
import 'package:pickme/shared/domain/entities/reviewer_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';

@Injectable(as: MyReviewsService)
class MyReviewsServiceImpl extends MyReviewsService{
  final ApiService apiService;

  MyReviewsServiceImpl({required this.apiService});

  Future<MyReviewsPageEntity> getMyReviews({required GetMyReviewsRepositoryParams params}) async{
    Response<dynamic> response = await apiService.get("$baseUrl$version/reviews/${params.userId}");
    if(response.statusCode==200){
      MyReviewsModelResponse myReviewsModelResponse = MyReviewsModelResponse.fromJson(response.data);

      return MyReviewsPageEntity(
          reviews: myReviewsModelResponse.data.map((e) => ReviewEntity(
              id: e.id,
              rating: e.rating,
              review: e.review,
              createdAt: e.createdAt,
              updatedAt: e.updatedAt,
              reviewer: ReviewerEntity(
                reviewerId: e.reviewer.reviewerId,
                firstName: e.reviewer.firstName,
                surname: e.reviewer.surname,
                profilePictureUrl: e.reviewer.profilePictureUrl,
                industry: IndustryEntity(
                  id: int.parse(e.reviewer.industry.id!),
                  industry: e.reviewer.industry.industry!,
                ),
              ),
              user: ReviewUserEntity(
                userId: e.user.userId,
                firstName: e.user.firstName,
                surname: e.user.surname,
                profilePictureUrl: e.user.profilePictureUrl,
              )
          )).toList(),
          paginationEntity: PaginationEntity(
            pageSize: myReviewsModelResponse.pagination.pageSize,
            pageNumber: myReviewsModelResponse.pagination.pageNumber,
            total: myReviewsModelResponse.pagination.total,
            totalPages: myReviewsModelResponse.pagination.totalPages,
            nextPage: myReviewsModelResponse.pagination.next_page,
            prevPage: myReviewsModelResponse.pagination.prev_page,
            searchTerm: myReviewsModelResponse.pagination.searchTerm,
          )
      );
    }
    throw "An error occurred";
  }
}