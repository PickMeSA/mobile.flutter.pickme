import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';

abstract class OTPGetTokenRepository  extends BaseRepository<OTPGetTokenRepositoryParams, TokenModel>{}

class OTPGetTokenRepositoryParams extends BaseRepositoryParams{

  final String smsCode;
  final String verificationID;

  OTPGetTokenRepositoryParams({required this.verificationID, required this.smsCode});
}
