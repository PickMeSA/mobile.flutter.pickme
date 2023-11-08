import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/token_local_storage/token_local_storage.dart';

@Injectable(as: TokenLocalStorage )
class TokenLocalStorageImpl extends TokenLocalStorage{



  TokenLocalStorageImpl();
  @override
  Future<TokenModel> getToken() {
    if(boxTokens.isNotEmpty){
      return Future.value(boxTokens.get(current));
    }else{
      return  Future.value(TokenModel(refreshToken: "", accessToken: "", tokenID: ""));
    }
  }

  @override
  Future<bool> setToken(TokenModel tokenModel) {
    boxTokens.put(current, TokenModel(
        refreshToken: tokenModel.refreshToken,
        accessToken: tokenModel.accessToken,
        tokenID: tokenModel.tokenID));
    return Future.value(true);
  }

  @override
  Future<bool> eraseToken() {
    boxTokens.delete(current);
    return Future.value(true);
  }



}