import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/InAppPurchaseRequestEntity.dart';
import 'package:pickme/shared/domain/entities/InAppPurchaseResponseEntity.dart';
import 'package:pickme/shared/functions/md5_hasher.dart';
import 'package:pickme/shared/models/in_app_purchases/in_app_purchase_activation_response_model.dart';

import '../../../../../core/locator/locator.dart';
import '../../../../../localization/generated/l10n.dart';
import '../../../../constants/default_values.dart';
import '../../../../in_app_purchases/presentation/models/in_app_purchase_details.dart';
import '../../../../remote/api-service.dart';
import 'in_app_purchases_service.dart';

@Injectable(as: InAppPurchasesService)
class InAppPurchasesServiceImpl extends InAppPurchasesService{
  final ApiService apiService;
  late AppLocalizations localization = locator<AppLocalizations>();
  InAppPurchasesServiceImpl(
      {required this.apiService});

  @override
  Future<InAppResponseActivationResultDetails> activate({
    required InAppPurchaseDetails purchaseDetails,
    required String userId,
    required String productId,
    required String salt,
  }) async{
    try{

      final productIdHash = generateHash(productId, salt);
      Response<dynamic> response = await apiService.post("$baseUrl$version/user/activate", data: {
        "verificationData": purchaseDetails.verificationData,
        "transactionId": purchaseDetails.purchaseID,
        "userIdentifier": userId,
        "productIdentifier": productIdHash,
        "skin": "IOS"
      });
      InAppPurchaseActivationResponseModel responseModel = InAppPurchaseActivationResponseModel.fromJson(response.data);
      return InAppResponseActivationResultDetails.fromModel(responseModel);
    }on DioException catch(ex) {
      logger.e(ex);
      final errorMessage = ex.message ?? "";
      if (errorMessage.isEmpty) {
        throw errorMessage;
      }
      throw localization.anErrorOccurredWhileProcessingYourRequest;
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<InAppResponseActivationResultDetails> checkSubscription(InAppPurchaseActivationRequestEntity requestEntity) async{
    try{
      Response<dynamic> response = await apiService.post("$baseUrl$version/check-subscription", data: requestEntity.toModel().toJson());
      InAppPurchaseActivationResponseModel responseModel = InAppPurchaseActivationResponseModel.fromJson(response.data);
      return InAppResponseActivationResultDetails.fromModel(responseModel);
    }catch(ex){
      logger.e(ex);
      if (ex is DioException) {
        if(ex.message!=null && ex.message!.isNotEmpty){
          throw ex.message!;
        }
        throw localization.anErrorOccurredWhileProcessingYourRequest;
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<InAppResponseActivationResultDetails> restoreSubscription(InAppPurchaseActivationRequestEntity requestEntity) async{
    try{
      Response<dynamic> response = await apiService.post("$baseUrl$version/restore", data: requestEntity.toModel().toJson());
      InAppPurchaseActivationResponseModel responseModel = InAppPurchaseActivationResponseModel.fromJson(response.data);
      return InAppResponseActivationResultDetails.fromModel(responseModel);
    }catch(ex){
      logger.e(ex);
      if (ex is DioException) {
        if(ex.message!=null && ex.message!.isNotEmpty){
          throw ex.message!;
        }
        throw localization.anErrorOccurredWhileProcessingYourRequest;
      } else {
        rethrow;
      }
    }
  }

}