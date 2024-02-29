import 'core/PickMeApp.dart';

void main() {
  PickMeApp.appInit(Environment.dev);
}

enum Environment{
  dev,
  uat,
  prod
}