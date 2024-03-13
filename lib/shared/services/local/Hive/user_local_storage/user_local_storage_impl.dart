import 'package:injectable/injectable.dart';

import '../../../../local/hive_storage_init.dart';
import 'user/user_model.dart';
import 'user_local_storage.dart';

@Singleton(as: UserLocalStorage)
class UserLocalStorageHiveImpl implements UserLocalStorage{
  final HiveLocalStorage hiveLocalStorage;
  UserLocalStorageHiveImpl({required this.hiveLocalStorage});

  @override
  UserModel getUser(){
    if(hiveLocalStorage.getBoxUser().isNotEmpty){
      UserModel userModel = hiveLocalStorage.getBoxUser().get(
          BoxNames.CURRENT.toString());
      return userModel;
    } else{
    throw("no profile saved");
    }
  }
  @override
  void setUser(UserModel userModel){
    hiveLocalStorage.setBoxUser(userModel);
  }
}