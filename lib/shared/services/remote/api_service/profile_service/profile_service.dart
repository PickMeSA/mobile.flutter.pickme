import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';
import 'package:pickme/shared/remote/api-service.dart';

abstract class ProfileService extends  PickMeCoreApi{
  ProfileService({required super.tokenLocalStorage});


  Future<bool> saveRemoteProfileData({required UserModel userModel});

  Future<UserModel> getRemoteProfileData();
}