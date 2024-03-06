import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';


import '../local/hive_storage_init.dart';

@Singleton()
class PickMeCoreApi{

  late String baseUrl;
  late String version;
  late String contentType;
  late String token;

  PickMeCoreApi(){
    initialiseAPIURLs();
  }

  initialiseAPIURLs()async {
    var pref = await SecureSharedPref.getInstance();
    baseUrl = await pref.getString("base_url", isEncrypted: true)??"";
    version = await pref.getString("api_version", isEncrypted: true)??"v1";
    //Found a bug in pref.getString("api_version") where the function returns empty string
    if(baseUrl.isEmpty){
      baseUrl = "https://api-prod.pick-me.co.za/api/";
    }
    if(version.isEmpty){
      version = "v1";
    }
  }

  Map<String, dynamic>? generateHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${generateToken()}',

    };

  }

  String generateToken() {
    TokenModel tokenModel = boxTokens.get(current);
    return tokenModel.accessToken;
  }



}