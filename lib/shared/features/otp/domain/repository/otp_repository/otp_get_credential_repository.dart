import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/base_classes/base_repository.dart';

abstract class OTPGetCredentialRepository  extends BaseRepository<OTPGetCredentialRepositoryParams, UserCredential>{}

class OTPGetCredentialRepositoryParams extends BaseRepositoryParams{

  final String smsCode;
  final String verificationID;

  OTPGetCredentialRepositoryParams({required this.verificationID, required this.smsCode});
}
