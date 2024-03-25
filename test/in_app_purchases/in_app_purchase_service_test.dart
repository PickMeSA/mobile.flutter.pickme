import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickme/shared/domain/entities/InAppPurchaseRequestEntity.dart';
import 'package:pickme/shared/domain/entities/InAppPurchaseResponseEntity.dart';
import 'package:pickme/shared/models/in_app_purchases/in_app_purchase_activation_response_model.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/in_app_purchases/in_app_purchases_service_impl.dart';

class MockApiService extends Mock implements ApiService{}

void main() {

  late InAppPurchasesServiceImpl inAppPurchasesService;
  late MockApiService mockApiService;

  setUp(() {
    FlavorConfig(
      name: "TEST",
      variables: jsonDecode('{"digital_oceans":{"base_url" : "https://api-prod.pick-me.co.za/api/","version": "v1"}}'),
    );
    mockApiService = MockApiService();
    inAppPurchasesService = InAppPurchasesServiceImpl(apiService: mockApiService);
  });

  group('InAppPurchasesService', () {
    const requestEntity = InAppPurchaseActivationRequestEntity(userIdentifier: 'userIdentifier', productIdentifier: 'productIdentifier', skin: 'skin', receiptNumber: 'receiptNumber', icloudIdentifier: 'icloudIdentifier');
    const responseJson = {
      "activated": true,
      "error":  {
        "message": "",
        "code": 1
      }
    };
    InAppPurchaseActivationResponseModel responseModel = InAppPurchaseActivationResponseModel.fromJson(responseJson);
    InAppResponseActivationResultDetails expectedEntity = InAppResponseActivationResultDetails.fromModel(responseModel);

    // test('activate should return expected response entity on successful response', () async {
    //   when(mockApiService.post('/activate', data: requestEntity.toModel().toJson()))
    //       .thenAnswer((_) async => Response(data: responseJson, statusCode: 200, requestOptions: RequestOptions(path: '/activate')));
    //
    //   // final result = await inAppPurchasesService.activate(requestEntity);
    //
    //   expect(result, equals(expectedEntity));
    //   verify(mockApiService.post('/activate', data: requestEntity.toModel().toJson())).called(1);
    // });
  });
}
