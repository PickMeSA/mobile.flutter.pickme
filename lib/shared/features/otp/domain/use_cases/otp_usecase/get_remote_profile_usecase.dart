import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart';

import '../../../../../../core/exceptions/exception.dart';
import '../../../../../../core/exceptions/profile_not_found.dart';

@Injectable()
class GetRemoteProfileUseCase
    extends BaseUseCase<GetRemoteProfileUseCaseParams, ProfileEntity> {
  final GetRemoteProfileRepository getRemoteProfileRepository;
  late final localization = AppLocalizations();

  GetRemoteProfileUseCase({required this.getRemoteProfileRepository});

  @override
  Future<ProfileEntity> call({GetRemoteProfileUseCaseParams? params}) async {
    final email = params?.email;
    if (email == null && params?.id == null) {
      throw GenericException(
          localization.anErrorOccurredWhileProcessingYourRequest);
    }
    try {
      final profile = await getRemoteProfileRepository.call(
          params: GetRemoteProfileRepositoryParams(id: params?.id));
      if (profile.email == null) {
        return ProfileEntity.withEmail(email);
      }
      return profile;
    } on ProfileNotFound catch (_) {
      return ProfileEntity.withEmail(email);
    } catch (ex) {
      rethrow;
    }
  }
}

class GetRemoteProfileUseCaseParams extends BaseUseCaseParams {
  final String? id;
  final String? email;

  GetRemoteProfileUseCaseParams({this.email, this.id});
}
