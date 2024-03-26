import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

import '../../../../domain/entities/InAppPurchaseRequestEntity.dart';
import '../../../../domain/entities/InAppPurchaseResponseEntity.dart';
import '../../../../in_app_purchases/presentation/models/in_app_purchase_details.dart';
import '../../../../remote/PickMeApiCore.dart';

abstract class InAppPurchasesService extends PickMeCoreApi{
  Future<InAppResponseActivationResultDetails> activate({
    required InAppPurchaseDetails purchaseDetails,
    required String userId,
    required String productId,
    required String salt,
  });
  Future<InAppResponseActivationResultDetails> restoreSubscription(InAppPurchaseActivationRequestEntity requestEntity);
  Future<InAppResponseActivationResultDetails> checkSubscription(InAppPurchaseActivationRequestEntity requestEntity);
}