import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_type_local_storage/user_type_model.dart';

class UserTypeStore{
  void storeUserType(String userType) async {
    var userTypeModel = UserTypeModel(userType);
    await boxUserType.put('CURRENT', userTypeModel);
  }

  Future<String?> retrieveUserType() async {
    var userTypeModel = await boxUserType.get('CURRENT') as UserTypeModel?;
    return userTypeModel?.userType;
  }
}