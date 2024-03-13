

import 'package:injectable/injectable.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/login/domain/entities/app_state/app_state_model.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';

import 'app_state_local_storage.dart';

@Injectable(as: AppStateLocalStorage)
class AppStateLocalStorageImpl extends AppStateLocalStorage{

  @override
  bool getFirstTime() {
    HiveLocalStorage hiveLocalStorageInit = locator<HiveLocalStorage>();
    return hiveLocalStorageInit.boxAppState.isEmpty;
  }

  @override
  Future<bool> setFirstTime() {
    HiveLocalStorage hiveLocalStorageInit = locator<HiveLocalStorage>();
    hiveLocalStorageInit.boxAppState.put(BoxNames.CURRENT.toString(),
        AppStateModel(
            loggedIn: false));
    return Future.value(true);
  }

  @override
  Future<bool> setSignedIn({ required bool signedIn}) {
    HiveLocalStorage hiveLocalStorageInit = locator<HiveLocalStorage>();
    hiveLocalStorageInit.boxAppState.put(BoxNames.CURRENT.toString(),
       AppStateModel(
            loggedIn: signedIn));
   return Future.value(true);
  }

  @override
  Future<bool> getSignedIn() {
    HiveLocalStorage hiveLocalStorageInit = locator<HiveLocalStorage>();
    if(hiveLocalStorageInit.boxAppState.isNotEmpty) {
      AppStateModel appStateModel = hiveLocalStorageInit.boxAppState.get(BoxNames.CURRENT.toString());
      return Future.value(appStateModel.loggedIn);
    }else{
      return Future.value(false);
    }
  }


}