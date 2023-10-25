abstract class BiometricsLocalStorage{
 Future<bool> getBiometrics();
  Future<bool> setBiometrics({required bool value});
  bool getOptionSelected();
}