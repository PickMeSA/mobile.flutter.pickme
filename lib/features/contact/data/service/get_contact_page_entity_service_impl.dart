import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/contact/domain/entities/contact_page_entity.dart';
import 'package:pickme/features/contact/domain/repository/get_my_reviews_page_entity_repository.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/domain/entities/review_entity.dart';
import 'package:pickme/shared/domain/entities/review_user_entity.dart';
import 'package:pickme/shared/domain/entities/reviewer_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';

import 'get_contact_page_entity_service.dart';

@Injectable(as: ContactPageService)
class ContactPageServiceImpl extends ContactPageService{
  final ApiService apiService;

  ContactPageServiceImpl({required this.apiService});

  Future<ContactPageEntity> getMyReviews({required GetContactPageEntityRepositoryParams params}) async{
    try{

      throw "Not implemented";
    }catch(ex){
      logger.e(ex);
      rethrow;
    }
  }
}