

import 'package:injectable/injectable.dart';
import 'package:pickme/features/register/data/model/user/user_model.dart';
import 'package:pickme/features/register/domain/entities/user/user.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:dio/dio.dart';

@injectable
class UserService  extends PickMeCoreApi{
  
  final ApiService apiService;
  
  
  UserService({required this.apiService, required super.tokenLocalStorage});
  
  Future<bool> registerUser({required User user}) async {
     await apiService.post("$baseUrl$version/users",
     data: UserModel(
          email:  user.email,
         idNumber: user.idNumber,
         surname: user.surname,
         firstName: user.firstName,
         mobile: user.mobile,
         passportNumber:
         user.passportNumber,
         workPermitNumber: user.workPermitNumber,
       id: '',
       profileType: '',
       subscriptionType: '',
       isActive: false,).toJson(),
      options: Options(headers: generateHeaders()));
    return true;
  }
}