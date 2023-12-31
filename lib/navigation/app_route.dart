
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/landing/presentation/landing_page.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/features/register/presentation/register_page.dart';
import 'package:pickme/features/sign_up/presentation/sign_up_page.dart';
import 'package:pickme/shared/features/otp/presentation/otp_page.dart';
import 'package:pickme/shared/features/resend_otp/presentation/resend_otp_page.dart';


import '../features/login/presentation/login_page.dart';

part 'app_route.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter{

  @override
  List<AutoRoute> get routes =>[
    AnimatedRoute(
      page: LandingRoute.page,
      initial: true,

    ),
    AnimatedRoute(
        page: LoginRoute.page,),
    AnimatedRoute(
        page: RegisterRoute.page,),
    AnimatedRoute(
      page: OtpRoute.page,),
    AnimatedRoute(
      page: ResendOTPRoute.page,),


  ];
}

class AnimatedRoute extends CustomRoute{

  AnimatedRoute({
    super.maintainState,
    required super.page,
    super.path,
    super.durationInMilliseconds = 500,
    super.children,
    super.transitionsBuilder = TransitionsBuilders.slideLeftWithFade,
    super.initial

});
}