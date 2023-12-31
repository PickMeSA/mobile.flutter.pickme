


import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'authentication.dart';

@Singleton(as: Authentication)
class PFirebaseAuthentication extends Authentication {
  final FirebaseAuth firebaseAuth;

  String? verificationId;
  int? resentToken;


  PFirebaseAuthentication({required this.firebaseAuth}) {}

  @override
  Future<void> authenticate({ required String mobileNumber})  async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+27810434369',
      timeout: const Duration(minutes: 1),
      autoRetrievedSmsCodeForTesting:"984596",
      verificationCompleted: (PhoneAuthCredential credential) async{
        final fCredential = credential;
        await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
          await value.user!.getIdToken(true).then((value1) => print(value1));
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        final fFailure = e;
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Future<UserCredential> getCredential({
    required String verificationId,
    required String smsCode}) async {

    try{
      return await firebaseAuth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode));
    }catch(ex){
      rethrow;
    }
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> codeSent({
    Function(String verificationId, int? resendToken)? onSuccess,
    Function(String error)? onError,
    required String mobileNumber}) async{

    try {
       await firebaseAuth.verifyPhoneNumber(
          phoneNumber: mobileNumber,
          codeAutoRetrievalTimeout: (verificationId) {},
          timeout: const Duration(seconds: 120),
          verificationCompleted: (credential) {},
          verificationFailed: (e) =>
           throw(e),
          codeSent: (String verificationId, int? resentToken){
            this.verificationId = verificationId;
            this.resentToken = resentToken;
            onSuccess!(this.verificationId!, this.resentToken);
          }
       ) ;


    }catch(ex) {
      onError!(ex.toString());
    }
          //codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)

  }


  Future<TokenModel> getToken({required String otp}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: this.verificationId!, smsCode: otp);
      return TokenModel(
          refreshToken: credential.token.toString(),
          accessToken: credential.accessToken!,
          tokenID: "");
    } catch (ex) {
      rethrow;
    }
  }
}