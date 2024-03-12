


import 'package:pickme/features/login/domain/entities/token/token_model.dart';

abstract class TokenLocalStorage{

  TokenModel getToken();

  bool setToken(TokenModel model);
  bool eraseToken();
}