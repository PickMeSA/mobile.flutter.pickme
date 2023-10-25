

abstract class AppStateLocalStorage{
 // bool setAppState({required bool signedIn });
  bool getFirstTime();
  Future<bool> getSignedIn();
  Future<bool> setFirstTime();
  Future<bool> setSignedIn({required bool signedIn});

}