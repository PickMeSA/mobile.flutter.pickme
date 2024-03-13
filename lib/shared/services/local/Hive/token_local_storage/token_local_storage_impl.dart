import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/token_local_storage/token_local_storage.dart';

import '../../../../../core/locator/locator.dart';

@Singleton(as: TokenLocalStorage )
class TokenLocalStorageImpl extends TokenLocalStorage{

  final HiveLocalStorage hiveLocalStorage;
  TokenLocalStorageImpl({required this.hiveLocalStorage});

  @override
  TokenModel getToken() {
    if(hiveLocalStorage.getBoxTokens().isNotEmpty){
      return hiveLocalStorage.getBoxTokens().get(BoxNames.CURRENT.toString());
    }else{
      return TokenModel(refreshToken: "", accessToken: "", tokenID: "");//Leaving this here coz I don't know why this was done
    }
  }

  @override
  bool setToken(TokenModel tokenModel) {

    hiveLocalStorage.setBoxTokens(TokenModel(
        refreshToken: tokenModel.refreshToken,
        accessToken: tokenModel.accessToken,
        tokenID: tokenModel.tokenID));
    return true;
  }

  @override
  bool eraseToken() {
    hiveLocalStorage.getBoxTokens().delete(BoxNames.CURRENT);
    return true;
  }



}