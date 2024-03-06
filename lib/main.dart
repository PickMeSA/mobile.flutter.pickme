import 'core/PickMeApp.dart';

void main() {
  PickMeApp.appInit(Environment.prod);
}

enum Environment{
  dev,
  uat,
  prod
}