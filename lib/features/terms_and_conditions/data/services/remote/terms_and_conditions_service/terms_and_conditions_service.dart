import 'package:dio/dio.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class TermsAndConditionsService extends PickMeCoreApi{
  TermsAndConditionsService();


  Future<Response<dynamic>> getRemoteTermsAndConditions();

  Future<Response<dynamic>> submitRemoteTermsAndConditions();


}