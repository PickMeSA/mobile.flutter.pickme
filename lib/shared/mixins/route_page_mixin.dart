import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pickme/features/final_details/presentation/final_details_page.dart';
import 'package:pickme/localization/generated/l10n.dart';
import '../../navigation/app_route.dart';
import '../features/otp/domain/entities/profile_entity.dart';
import '../functions/utlis.dart';

mixin RoutePageMixin {
  void routePageReg(
      {required BuildContext context,
      required ProfileEntity profileEntity,
      int from = 0}) {
    assert(profileEntity.email != null, "Email cannot be null");
    final email = profileEntity.email;
    if (email == null) {
      throw Exception(AppLocalizations().error);
    }

    if (profileEntity?.firstName == null) {
      context.router.push(RegisterRoute(email: email));
    } else if (isNullOrDefault(profileEntity?.type)) {
      context.router.push(const SetupProfileRoute());
    } else if (isNullOrDefault(profileEntity.acceptedTermsAndConditions)) {
      context.router.push(const RegisterAccountStep1Route());
    } else if (isNullOrDefault(profileEntity?.qualifications) &&
        isNullOrDefault(profileEntity?.workExperience)) {
      context.router.push(QualificationsRoute(profileEntity: profileEntity));
    } else if (isNullOrDefault(profileEntity?.skills)) {
      context.router.push(AddSkillsRoute(profileEntity: profileEntity));
    } else if (isNullOrDefault(profileEntity?.hourlyRate)) {
      context.router.push(const RateAndWorkTimesRoute());
    } else if (profileEntity!.paymentDetails!.bankName!.isEmpty) {
      context.router.push(const BankDetailsRoute());
    } else if (isNullOrDefault(profileEntity?.location?.address)) {
      context.router.push(
        const LocationRoute(),
      );
    } else if (isNullOrDefault(profileEntity?.description)) {
      context.router.push(FinalDetailsRoute(profileEntity: profileEntity));
    } else if (isNullOrDefault(profileEntity?.subscriptionPaid)) {
      if (Platform.isIOS) {
        context.router.push(FinalDetailsRoute(profileEntity: profileEntity));
      } else {
        context.router.push(PaySomeoneWebViewRoute(from: 0));
      }
    } else {
      context.router.pushAndPopUntil(
          BottomNavigationBarRoute(profileEntity: profileEntity),
          predicate: (Route<dynamic> route) => false);
    }
  }
}
