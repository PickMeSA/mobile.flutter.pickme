import 'package:injectable/injectable.dart';
import 'package:pickme/shared/constants/default_values.dart';

import '../../domain/repository/submit_review_repository.dart';
import '../service/review_user_service.dart';

@Injectable(as: SubmitReviewRepository)
class SubmitReviewRepositoryImpl extends SubmitReviewRepository{
  final SubmitReviewService service;
  SubmitReviewRepositoryImpl({required this.service});
  @override
  Future<bool> call({SubmitReviewRepositoryParams? params}) async {
    try{
      return await service.submitReview(params: params!);
    }catch(ex){
      rethrow;
    }
  }

}
