
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/landing/presentation/landing_page.dart';
import 'package:pickme/features/register/presentation/register_page.dart';


import '../features/login/presentation/loginPage.dart';

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