

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/apply_for_job/data/response_models/apply_for_job_model_response/date_and_time_model_response.dart';
import 'package:pickme/features/apply_for_job/domain/entities/date_and_time.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/lat_long_entity.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/models/location/location_model_response/location_model_response.dart';
import 'package:pickme/shared/remote/api-service.dart';

import '../../../../domain/entities/session_secrets_entity.dart';
import '../../../../models/session_secrets_model/session_secrets_response_model.dart';
import 'in_app_purchases_service.dart';

@Singleton(as: InAppPurchasesService)
class InAppPurchasesServiceImplementation extends InAppPurchasesService{

  final ApiService apiService;

  InAppPurchasesServiceImplementation({required this.apiService});

  @override
  Future<SessionSecretsEntity> getServiceSecrets({required String jobid}) async{
  try{
    Response<dynamic> response = await apiService.get("$baseUrl$version/session-secrets");
    SessionSecretsResponseModel secretsResponseModel = SessionSecretsResponseModel.fromJson(response.data);
    return SessionSecretsEntity(sessionId: secretsResponseModel.sessionId, ttl: secretsResponseModel.ttl);
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