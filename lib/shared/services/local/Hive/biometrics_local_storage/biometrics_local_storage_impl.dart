
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';

import 'biometrics_local_storage.dart';

@Singleton(as: BiometricsLocalStorage)
class BiometricsLocalStorageImpl extends BiometricsLocalStorage{
  @override
  Future<bool> getBiometrics() {
    if(boxBiometrics.isNotEmpty){
      bool value = boxBiometrics.get(current);
      return Future.value( value);
    }else{
      return Future.value(false);
    }
  }

  @override
 Future<bool> setBiometrics({ required bool value}) {
    boxBiometrics.put(current, value);
    return Future.value(true);
  }

  @override
  bool getOptionSelected() {
    return boxBiometrics.isNotEmpty;
  }

}