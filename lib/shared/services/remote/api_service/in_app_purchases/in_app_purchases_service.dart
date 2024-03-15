
import '../../../../domain/entities/InAppPurchaseRequestEntity.dart';
import '../../../../domain/entities/InAppPurchaseResponseEntity.dart';
import '../../../../remote/PickMeApiCore.dart';

abstract class InAppPurchasesService extends PickMeCoreApi{
  Future<InAppResponseActivationResultDetails> activate(InAppPurchaseActivationRequestEntity requestEntity);
  Future<InAppResponseActivationResultDetails> restoreSubscription(InAppPurchaseActivationRequestEntity requestEntity);
  Future<InAppResponseActivationResultDetails> checkSubscription(InAppPurchaseActivationRequestEntity requestEntity);
}