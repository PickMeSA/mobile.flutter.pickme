import 'user/user_model.dart';

abstract class UserLocalStorage{
  UserModel getUser();
  void setUser(UserModel userModel);
}