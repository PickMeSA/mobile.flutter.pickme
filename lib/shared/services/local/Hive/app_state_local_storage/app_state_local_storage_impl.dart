

import 'package:injectable/injectable.dart';
import 'package:pickme/features/login/domain/entities/app_state/app_state_model.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';

import 'app_state_local_storage.dart';

@Injectable(as: AppStateLocalStorage)
class AppStateLocalStorageImpl extends AppStateLocalStorage{

  @override
  bool getFirstTime() {
   return boxAppState.isEmpty;
  }

  @override
  Future<bool> setFirstTime() {
    boxAppState.put(current,
        AppStateModel(
            loggedIn: false));
    return Future.value(true);
  }

  @override
  Future<bool> setSignedIn({ required bool signedIn}) {
   boxAppState.put(current,
       AppStateModel(
            loggedIn: signedIn));
   return Future.value(true);
  }

  @override
  Future<bool> getSignedIn() {
    if(boxAppState.isNotEmpty) {
      AppStateModel appStateModel = boxAppState.get(current);
      return Future.value(appStateModel.loggedIn);
    }else{
      return Future.value(false);
    }
  }


}