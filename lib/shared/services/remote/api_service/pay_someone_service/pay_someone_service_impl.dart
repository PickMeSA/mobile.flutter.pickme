import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/pay_someone_service/pay_someone_service.dart';

@Singleton(as: PaySomeoneService)
class PaySomeoneServiceImpl extends PaySomeoneService{
  
  final ApiService apiService;
  
  PaySomeoneServiceImpl({required this.apiService});
  @override
  Future<String> makePayment()async {
   try{
     Response<dynamic> response = await apiService.get("$baseUrl$version/checkouts/user");
     return response.data.toString();
   }catch(ex){
     rethrow;
   }
  }

}