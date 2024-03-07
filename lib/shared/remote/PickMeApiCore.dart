import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/services/local/Hive/token_local_storage/token_local_storage.dart';


import '../local/hive_storage_init.dart';

class PickMeCoreApi{

  late String baseUrl;
  late String version;
  late String contentType;
  late String token;

  PickMeCoreApi(){
    baseUrl = FlavorConfig.instance.variables["digital_oceans"]["base_url"];
    version = FlavorConfig.instance.variables["digital_oceans"]["version"];
  }

  Map<String, dynamic>? generateHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${generateToken()}',

    };

  }

  String generateToken() {
    TokenModel tokenModel = boxTokens.get(current);
    //return "eyJhbGciOiJSUzI1NiIsImtpZCI6IjAzZDA3YmJjM2Q3NWM2OTQyNzUxMGY2MTc0ZWIyZjE2NTQ3ZDRhN2QiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcGljay1tZS02MWYzNCIsImF1ZCI6InBpY2stbWUtNjFmMzQiLCJhdXRoX3RpbWUiOjE2OTgwNjY3NjEsInVzZXJfaWQiOiJvS0o5ZEFWanNwVzIxY3NOOVVuVnRsdTd0NXcxIiwic3ViIjoib0tKOWRBVmpzcFcyMWNzTjlVblZ0bHU3dDV3MSIsImlhdCI6MTY5ODA2Njc2MSwiZXhwIjoxNjk4MDcwMzYxLCJlbWFpbCI6InRlc3QxMjM0NUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsidGVzdDEyMzQ1QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.WE3g-hhFWi_bPdm_fo9mS9dJ2pL82KmeoTsUpstY8vUTJVI7uWK3FzUjv-xkMDaYBtPa2YXUfBK334LJlSyOGRyMHizqrLUVSUKrHToiR1h-yGTlwVZQ_86mnpay1stj4ks6PzYAWlW7C1mJMxfnT4qzsX9gm1a-QRk2Bn3ibg13MvYSbKHfJ4Rxp4iHkbXRiNhMGDFXcFwD51JW7eNWX2tovGmAU-4d9_TXLBOxMNAHgIJ1CYdumlm2zzJucXJWSIXXrLWlpixC1rOCflym6ajeU_UZ8xhZi-Y87re5X9MjiZla15Wdg82_gfSnC3AfO89Qw06bOhoAtCGqbd6GMw";
    return tokenModel.accessToken;
  }



}