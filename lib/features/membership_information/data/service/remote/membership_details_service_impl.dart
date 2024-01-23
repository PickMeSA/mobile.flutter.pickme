import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/membership_information/data/response_models/membership_information_model_response/membership_item_model_response.dart';
import 'package:pickme/features/membership_information/data/response_models/membership_item_list_model_response/membership_item_list_model_response.dart';
import 'package:pickme/features/membership_information/data/service/remote/membership_details_service.dart';
import 'package:pickme/features/membership_information/entities/information_item_entity.dart';
import 'package:pickme/features/membership_information/entities/membership_information_entity.dart';
import 'package:pickme/features/membership_information/entities/membership_item_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';

@Singleton(as: MembershipDetailsService)

class MembershipDetailsServiceImpl extends MembershipDetailsService{
  final ApiService apiService;
  MembershipDetailsServiceImpl({required this.apiService});

  @override
  Future<List<MembershipInformationEntity>> getMembershipInformationEntity() async {
    try {
      Response<dynamic> response = await apiService.get("$baseUrl$version/cms/membership-details");
      //String rawMemberList = json.decode(response.data);
      List<MembershipInformationEntity> membershipInformationListEntity = [];
      MembershipItemListModelResponse membershipItemListModelResponse = MembershipItemListModelResponse.fromJson({'membershipItemListModelResponse':response.data});
      membershipItemListModelResponse.membershipItemListModelResponse.forEach((memberElement) {
        List<InformationItemEntity> informationItemListEntity = [];
        memberElement.information.forEach((element) {
          informationItemListEntity.add(InformationItemEntity(
              description: element.description!, title: element.title!));
        });
        membershipInformationListEntity.add(MembershipInformationEntity(
            membershipItemEntity: MembershipItemEntity(
                description:  memberElement.description ,
                name:  memberElement.name), informationItemWEntityList: informationItemListEntity));
      });
      return membershipInformationListEntity;
    }catch(ex){
      rethrow;
    }
  }

}