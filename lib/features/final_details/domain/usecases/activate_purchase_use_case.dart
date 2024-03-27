import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/functions/md5_hasher.dart';
import '../../../../base_classes/base_usecase.dart';
import '../../../../core/locator/locator.dart';
import '../../../../localization/generated/l10n.dart';
import '../../../../shared/constants/default_values.dart';
import '../../../../shared/domain/entities/InAppPurchaseResponseEntity.dart';
import '../../../../shared/in_app_purchases/data/subscription_remote_data_source.dart';
import '../../../../shared/in_app_purchases/presentation/models/in_app_purchase_details.dart';
import '../../../../shared/local/hive_storage_init.dart';
import '../../../../shared/models/in_app_purchases/in_app_purchase_activate_request_model.dart';
import '../../../../shared/services/local/Hive/user_local_storage/user/user_model.dart';


@injectable
class ActivatePurchaseUseCase extends BaseUseCase<ActivatePurchaseUseCaseParams,
    InAppResponseActivationResultDetails> {
  final SubscriptionRemoteDatasource _subscriptionRemoteDatasource;
  late AppLocalizations localization = locator<AppLocalizations>();

  ActivatePurchaseUseCase(this._subscriptionRemoteDatasource);

  @override
  Future<InAppResponseActivationResultDetails> call(
      {ActivatePurchaseUseCaseParams? params}) async {
    try {
      if (params == null) {
        throw Exception('ActivatePurchaseUseCase: Params cannot be null');
      }
      UserModel userModel = boxUser.get(current);
      final productId = dotenv.env["IOS_IN_APP_PURCHASE_PRODUCT"];
      final salt = dotenv.env["SALT"];
      if (productId == null || salt == null) {
        logger.e("Product id or salt is not defined in .env file");
        throw localization.anErrorOccurredWhileProcessingYourRequest;
      }

      final transactionID = params.purchaseDetails.purchaseID;
      if (transactionID == null) {
        logger.e("Transaction ID not found, aborting account activation");
        throw localization.anErrorOccurredWhileProcessingYourRequest;
      }


      final activationRequest = InAppPurchaseActivationRequestModel(
          userIdentifier: userModel.id.toString(),
          productIdentifier: generateHash(productId, salt),
          skin: 'IOS',
          transactionID: transactionID,
          verificationData: params.purchaseDetails.verificationData);
      return await _subscriptionRemoteDatasource.activateSubscription(activationRequest);

    } catch (ex, stackTrace) {
      logger.e('Error when activating subscription', error: ex, stackTrace: stackTrace);
      rethrow;
    }
  }
}


class ActivatePurchaseUseCaseParams extends BaseUseCaseParams {
  final InAppPurchaseDetails purchaseDetails;

  ActivatePurchaseUseCaseParams({required this.purchaseDetails});
}

