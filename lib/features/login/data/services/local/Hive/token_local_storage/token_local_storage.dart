


import 'package:pickme/features/login/domain/entities/token/token_model.dart';

abstract class TokenLocalStorage{

  Future<TokenModel> getToken();

  Future<bool> setToken(TokenModel model);

  Future<bool> eraseToken();
}