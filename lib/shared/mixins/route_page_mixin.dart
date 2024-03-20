import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../navigation/app_route.dart';
import '../features/otp/domain/entities/profile_entity.dart';
import '../in_app_purchases/presentation/in_app_purchase_bloc.dart';

mixin RoutePageMixin{
  void routePageReg({required BuildContext context, required ProfileEntity profileEntity, int from = 0}){
    if(profileEntity.skills!.isEmpty){
      context.router.push( AddSkillsRoute(profileEntity:  profileEntity));
    }else if(profileEntity.hourlyRate! == 0){
      context.router.push(const RateAndWorkTimesRoute());
    }else if(profileEntity.paymentDetails!.bankName!.isEmpty){
      context.router.push(const BankDetailsRoute());
    }else if(profileEntity.location!.address == "" ){
      context.router.push(const LocationRoute());
    }else if(profileEntity.description!.isEmpty){
      context.router.push(const FinalDetailsRoute());
    }else if(!profileEntity.subscriptionPaid!) {
      if(Platform.isIOS){
        BlocProvider.of<InAppPurchasesBloc>(context).add(CreateSubscriptionEvent());
      }else{
        context.router.push( PaySomeoneWebViewRoute(from: from));
      }
    }else{
      context.router.pushAndPopUntil( BottomNavigationBarRoute(), predicate: (Route<dynamic> route) => false);
    }
  }
}