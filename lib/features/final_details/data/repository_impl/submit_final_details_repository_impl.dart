import 'package:injectable/injectable.dart';
import 'package:pickme/features/bank_details/domain/repository/bank_details_submitted_repository.dart';
import 'package:pickme/features/final_details/domain/repository/submit_final_details_repository.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/services/remote/api_service/profile_service/profile_service.dart';

@Injectable(as: SubmitFinalDetailsRepository)
class SubmitFinalDetailsRepositoryImpl extends SubmitFinalDetailsRepository{
  final ProfileService profileService;

  SubmitFinalDetailsRepositoryImpl({required this.profileService});

  @override
  Future<ProfileEntity> call({SubmitFinalDetailsRepositoryParams? params}) {
    return profileService.submitFinalDetails(finalDetailsEntity: params!.finalDetailsEntity);
  }
}