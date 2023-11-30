import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';
import 'package:pickme/shared/remote/api-service.dart';

abstract class UserService extends  PickMeCoreApi{
  UserService({required super.tokenLocalStorage});


  Future<UserEntity> saveRemoteProfileData({required UserEntity userModel});

  Future<UserEntity> getRemoteProfileData();
}