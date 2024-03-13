
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile_local_storage.dart';

@Injectable(as: RegisterOTPCompleteRepository)
class RegisterOTPCompleteRepositoryImpl extends RegisterOTPCompleteRepository {

  final ProfileLocalStorage profileLocalStorage;

  RegisterOTPCompleteRepositoryImpl({required this.profileLocalStorage});

  @override
  Future<bool> call({RegisterOTPCompleteRepositoryParams? params}) {
   try{
     profileLocalStorage.setProfileDetails( profileModel:
         ProfileModel(
             workPermitNumber: params!.userModel.workPermitNumber,
             idNumber: params.userModel.idNumber,
             emailAddress: params.userModel.email,
             phoneNumber: params.userModel.mobile,
             surname: params.userModel.surname,
             firstName: params.userModel.firstName,
             passportNumber: params.userModel.passportNumber)
     );
      return Future.value(true);
   }catch(ex){
     rethrow;
   }
  }

}
