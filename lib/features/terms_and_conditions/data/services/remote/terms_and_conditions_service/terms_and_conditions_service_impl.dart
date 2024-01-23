import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart';
import 'package:pickme/shared/remote/api-service.dart';

@Injectable(as: TermsAndConditionsService)

class TermsAndConditionsServiceImpl extends TermsAndConditionsService{
  
  final ApiService apiService;
  
  TermsAndConditionsServiceImpl({required this.apiService});
  @override
  Future<Response<dynamic>>getRemoteTermsAndConditions() async{
    Response<dynamic> response = await apiService.get("$baseUrl$version/cms/terms-and-conditions");
    return response;
  }

  @override
  Future<Response<dynamic>> submitRemoteTermsAndConditions() {
    // TODO: implement submitRemoteTermsAndConditions
    throw UnimplementedError();
  }
  
}