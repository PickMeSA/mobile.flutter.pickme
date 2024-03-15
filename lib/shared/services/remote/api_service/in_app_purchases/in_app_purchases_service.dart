
import '../../../../domain/entities/InAppPurchaseRequestEntity.dart';
import '../../../../domain/entities/InAppPurchaseResponseEntity.dart';
import '../../../../remote/PickMeApiCore.dart';

abstract class InAppPurchasesService extends PickMeCoreApi{
  Future<InAppPurchaseActivationResponseEntity> activate(InAppPurchaseActivationRequestEntity requestEntity);
  Future<InAppPurchaseActivationResponseEntity> restoreSubscription(InAppPurchaseActivationRequestEntity requestEntity);
  Future<InAppPurchaseActivationResponseEntity> checkSubscription(InAppPurchaseActivationRequestEntity requestEntity);
}