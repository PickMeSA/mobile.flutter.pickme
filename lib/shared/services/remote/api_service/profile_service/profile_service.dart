import 'package:pickme/features/setup_profile/domain/entities/profile_type_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class ProfileService extends PickMeCoreApi{
  ProfileService({required super.tokenLocalStorage});

  Future<bool> submitProfileType(ProfileTypeEntity profileTypeEntity);

}