import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/review_a_user/domain/repository/submit_review_repository.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/remote/api-service.dart';
import '../models/submit_review_request_model/submit_review_request_model.dart';
import 'review_user_service.dart';

@Injectable(as: SubmitReviewService)
class SubmitReviewServiceImpl extends SubmitReviewService{
  final ApiService apiService;

  SubmitReviewServiceImpl({required this.apiService});

  @override
  Future<bool> submitReview({required SubmitReviewRepositoryParams params}) async{
    try{
      Response<dynamic> response = await apiService.post(
          "$baseUrl$version/reviews",
          data: SubmitReviewRequestModel(
            rating: params.rating,
            review: params.review,
            reviewerId: params.reviewerId,
            userId: params.userId,
          ).toJson()
      );
      if(response.statusCode==201){
        return true;
      }else if(response.data["message"]!=null){
        throw response.data["message"];
      }
      throw "An error occurred";
    }catch(ex){
      logger.e(ex);
      rethrow;
    }
  }
}