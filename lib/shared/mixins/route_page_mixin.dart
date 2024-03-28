import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../navigation/app_route.dart';
import '../features/otp/domain/entities/profile_entity.dart';
import '../functions/string_ext.dart';

mixin RoutePageMixin{
  void routePageReg({required BuildContext context, required ProfileEntity profileEntity, int from = 0}){
    if(isNullOrEmpty(profileEntity.skills)){
      context.router.push( AddSkillsRoute(profileEntity:  profileEntity));
    }else if(profileEntity.hourlyRate == null || profileEntity?.hourlyRate == 0){
      context.router.push(const RateAndWorkTimesRoute());
    }else if(isNullOrEmpty(profileEntity.paymentDetails?.bankName)){
      context.router.push(const BankDetailsRoute());
    }else if(isNullOrEmpty(profileEntity.location?.address)){
      context.router.push(const LocationRoute());
    }else if(profileEntity.description!.isEmpty || isNullOrEmpty(profileEntity.subscriptionPaid)){
      context.router.push(FinalDetailsRoute(profileEntity: profileEntity));
    }else{
      context.router.pushAndPopUntil( BottomNavigationBarRoute(), predicate: (Route<dynamic> route) => false);
    }
  }
}