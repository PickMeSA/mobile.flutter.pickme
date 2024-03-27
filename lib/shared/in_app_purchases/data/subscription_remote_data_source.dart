import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/locator/locator.dart';
import '../../../localization/generated/l10n.dart';
import '../../constants/default_values.dart';
import '../../domain/entities/InAppPurchaseResponseEntity.dart';
import '../../models/in_app_purchases/in_app_purchase_activate_request_model.dart';
import '../../models/in_app_purchases/in_app_purchase_activation_response_model.dart';
import '../../remote/PickMeApiCore.dart';
import '../../remote/api-service.dart';

abstract class SubscriptionRemoteDatasource extends PickMeCoreApi {
  Future<InAppResponseActivationResultDetails> activateSubscription(
      InAppPurchaseActivationRequestModel requestModel);
}

@Injectable(as: SubscriptionRemoteDatasource)
class InAppPurchasesServiceImpl extends SubscriptionRemoteDatasource {
  final ApiService apiService;
  late AppLocalizations localization = locator<AppLocalizations>();

  InAppPurchasesServiceImpl({required this.apiService});

  @override
  Future<InAppResponseActivationResultDetails> activateSubscription(
      InAppPurchaseActivationRequestModel requestModel) async {
    try {
      Response<dynamic> response = await apiService
          .post("$baseUrl$version/users/activate", data: requestModel.toJson());
      InAppPurchaseActivationResponseModel responseModel =
          InAppPurchaseActivationResponseModel.fromJson(response.data);
      return InAppResponseActivationResultDetails.fromModel(responseModel);
    } on DioException catch (ex) {
      logger.e({"Activation error":ex});
      final errorMessage = ex.message ?? "";
      if (errorMessage.isEmpty) {
        throw errorMessage;
      }
      throw localization.anErrorOccurredWhileProcessingYourRequest;
    } catch (ex) {
      rethrow;
    }
  }
}
