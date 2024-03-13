import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_type_local_storage/user_type_model.dart';

import '../../../../../core/locator/locator.dart';

class UserTypeStore{
  void storeUserType(String userType) async {
    var userTypeModel = UserTypeModel(userType);
    HiveLocalStorage hiveLocalStorageInit = locator<HiveLocalStorage>();
    await hiveLocalStorageInit.setBoxUserType(userTypeModel);
  }

  Future<String?> retrieveUserType() async {
    HiveLocalStorage hiveLocalStorageInit = locator<HiveLocalStorage>();
    var userTypeModel = await hiveLocalStorageInit.getBoxUserType().get('CURRENT') as UserTypeModel?;
    return userTypeModel?.userType;
  }
}