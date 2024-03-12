
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';

import '../../../../../core/locator/locator.dart';
import 'biometrics_local_storage.dart';

@Singleton(as: BiometricsLocalStorage)
class BiometricsLocalStorageImpl extends BiometricsLocalStorage{
  @override
  Future<bool> getBiometrics() {
    HiveLocalStorage hiveLocalStorageInit = locator<HiveLocalStorage>();
    if(hiveLocalStorageInit.getBoxBiometrics().isNotEmpty){
      bool value = hiveLocalStorageInit.getBoxBiometrics().get(BoxNames.CURRENT);
      return Future.value( value);
    }else{
      return Future.value(false);
    }
  }

  @override
 Future<bool> setBiometrics({ required bool value}) {
    HiveLocalStorage hiveLocalStorageInit = locator<HiveLocalStorage>();
    hiveLocalStorageInit.setBoxBiometrics(value);
    return Future.value(true);
  }

  @override
  bool getOptionSelected() {
    HiveLocalStorage hiveLocalStorageInit = locator<HiveLocalStorage>();
    return hiveLocalStorageInit.getBoxBiometrics().isNotEmpty;
  }

}