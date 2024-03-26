import 'package:injectable/injectable.dart';
import 'package:pickme/shared/services/remote/api_service/in_app_purchases/in_app_purchases_service.dart';

import '../../../../base_classes/base_usecase.dart';
import '../../../../shared/constants/default_values.dart';
import '../../../../shared/domain/entities/InAppPurchaseResponseEntity.dart';
import '../../../../shared/in_app_purchases/presentation/models/in_app_purchase_details.dart';
import '../../../../shared/local/hive_storage_init.dart';
import '../../../../shared/services/local/Hive/user_local_storage/user/user_model.dart';

@injectable
class ActivatePurchaseUseCase extends BaseUseCase<ActivatePurchaseUseCaseParams, InAppResponseActivationResultDetails>{
  final InAppPurchasesService _inAppPurchasesService;

  ActivatePurchaseUseCase(this._inAppPurchasesService);

  @override
  Future<InAppResponseActivationResultDetails> call({ActivatePurchaseUseCaseParams? params}) async {
    try{
      UserModel userModel = boxUser.get(current);
      return await _inAppPurchasesService.activate(
          purchaseDetails: params!.purchaseDetails,
          userId: userModel.id.toString()
      );
    }catch(ex){
      logger.e({'ActivatePurchaseUseCase', ex});
      rethrow;
    }
  }
}

class ActivatePurchaseUseCaseParams extends BaseUseCaseParams{
  final InAppPurchaseDetails purchaseDetails;
  ActivatePurchaseUseCaseParams({required this.purchaseDetails});
}