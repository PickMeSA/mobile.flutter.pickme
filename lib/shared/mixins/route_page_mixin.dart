import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pickme/features/final_details/presentation/final_details_page.dart';
import 'package:pickme/localization/generated/l10n.dart';
import '../../navigation/app_route.dart';
import '../features/otp/domain/entities/profile_entity.dart';
import '../functions/utlis.dart';

mixin PaymentPageMixin {

  void routeToPaymentOrHome(
      {required BuildContext context,
      required ProfileEntity profileEntity,
      int from = 0}) {
    assert(profileEntity.email != null, "Email cannot be null");
    final email = profileEntity.email;
    if (email == null) {
      throw Exception(AppLocalizations().error);
    }

     if (isNullOrDefault(profileEntity?.subscriptionPaid)) {
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
