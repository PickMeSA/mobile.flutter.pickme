import 'package:dio/dio.dart';
import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/terms_and_conditions/data/models/terms_and_conditions_model_response/get_terms_and_conditions_model_response.dart';
import 'package:pickme/features/terms_and_conditions/domain/entities/terms_and_conditions_entity.dart';
import 'package:pickme/features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart';

import '../../services/remote/terms_and_conditions_service/terms_and_conditions_service.dart';

@Injectable(as: GetRemoteTermsAndConditionsRepository)
class GetRemoteTermsAndConditionsRepositoryImpl extends GetRemoteTermsAndConditionsRepository {
  TermsAndConditionsService termsAndConditionsService;
  GetRemoteTermsAndConditionsRepositoryImpl({required this.termsAndConditionsService});

  @override
  Future<TermsAndConditionsEntity> call({GetRemoteTermsAndConditionsRepositoryParams? params}) async {
    try {
      Response<dynamic> response = await termsAndConditionsService
          .getRemoteTermsAndConditions();
      GetTermsAndConditionsModelResponse termsAndConditionsModelResponse = GetTermsAndConditionsModelResponse
          .fromJson(response.data);
      return TermsAndConditionsEntity(
          termsAndConditions: termsAndConditionsModelResponse
              .termsAndConditions!);
    }catch(ex){
      rethrow;
    }
  }

}
