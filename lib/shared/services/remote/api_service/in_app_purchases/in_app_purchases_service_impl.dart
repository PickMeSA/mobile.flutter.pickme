import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/InAppPurchaseRequestEntity.dart';
import 'package:pickme/shared/domain/entities/InAppPurchaseResponseEntity.dart';
import 'package:pickme/shared/models/in_app_purchases/in_app_purchase_activation_response_model.dart';

import '../../../../constants/default_values.dart';
import '../../../../remote/api-service.dart';
import 'in_app_purchases_service.dart';

@Injectable(as: InAppPurchasesService)
class InAppPurchasesServiceImpl extends InAppPurchasesService{
  final ApiService apiService;

  InAppPurchasesServiceImpl(
      {required this.apiService});
  @override
  Future<InAppPurchaseActivationResponseEntity> activate(InAppPurchaseActivationRequestEntity requestEntity) async{
    try{
      Response<dynamic> response = await apiService.post("$baseUrl$version/activate", data: requestEntity.toModel().toJson());
      InAppPurchaseActivationResponseModel responseModel = InAppPurchaseActivationResponseModel.fromJson(response.data);
      return InAppPurchaseActivationResponseEntity.fromModel(responseModel);
    }catch(ex){
      logger.e(ex);
      if (ex is DioException) {
        if(ex.message!=null && ex.message!.isNotEmpty){
          throw ex.message!;
        }
        throw "An error occurred while processing your request. Please try again later.";
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<InAppPurchaseActivationResponseEntity> checkSubscription(InAppPurchaseActivationRequestEntity requestEntity) async{
    try{
      Response<dynamic> response = await apiService.post("$baseUrl$version/check-subscription", data: requestEntity.toModel().toJson());
      InAppPurchaseActivationResponseModel responseModel = InAppPurchaseActivationResponseModel.fromJson(response.data);
      return InAppPurchaseActivationResponseEntity.fromModel(responseModel);
    }catch(ex){
      logger.e(ex);
      if (ex is DioException) {
        if(ex.message!=null && ex.message!.isNotEmpty){
          throw ex.message!;
        }
        throw "An error occurred while processing your request. Please try again later.";
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<InAppPurchaseActivationResponseEntity> restoreSubscription(InAppPurchaseActivationRequestEntity requestEntity) async{
    try{
      Response<dynamic> response = await apiService.post("$baseUrl$version/restore", data: requestEntity.toModel().toJson());
      InAppPurchaseActivationResponseModel responseModel = InAppPurchaseActivationResponseModel.fromJson(response.data);
      return InAppPurchaseActivationResponseEntity.fromModel(responseModel);
    }catch(ex){
      logger.e(ex);
      if (ex is DioException) {
        if(ex.message!=null && ex.message!.isNotEmpty){
          throw ex.message!;
        }
        throw "An error occurred while processing your request. Please try again later.";
      } else {
        rethrow;
      }
    }
  }

}