import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class PaySomeoneService extends PickMeCoreApi{

  Future<String> makePayment ();
}