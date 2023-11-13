
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';

abstract class Authentication{

  Future<void> authenticate({required String mobileNumber});

  Future<TokenModel> getToken({required String otp});


  Future<UserCredential> getCredential({
    required String verificationId,
    required String smsCode});

  Future<bool> logout();

  Future<void> codeSent({
    Function(String? verificationId, int? resendToken)onSuccess,
    Function(String? error) onError,
    required String mobileNumber});



}