import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';
import '../../domain/entities/review_a_user_page_entity.dart';
import '../../domain/repository/get_review_a_user_page_entity_repository.dart';

@Injectable(as: GetReviewUserPageEntityRepository)
class GetReviewUserPageEntityRepositoryImpl extends GetReviewUserPageEntityRepository{
  ProfileService profileService;

  GetReviewUserPageEntityRepositoryImpl({required this.profileService});

  @override
  Future<ReviewAUserPageEntity> call({GetReviewUserPageEntityRepositoryParams? params}) async {
    ProfileEntity profile = await profileService.getRemoteProfileData(userId: params!.userId);
    return ReviewAUserPageEntity(
      user: profile
    );
  }

}