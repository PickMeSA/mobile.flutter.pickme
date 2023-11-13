// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    ResendOTPRoute.name: (routeData) {
      final args = routeData.argsAs<ResendOTPRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResendOTPPage(
          key: args.key,
          userModel: args.userModel,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    OtpRoute.name: (routeData) {
      final args =
          routeData.argsAs<OtpRouteArgs>(orElse: () => const OtpRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OTPPage(
          key: args.key,
          userModel: args.userModel,
        ),
      );
    },
  };
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResendOTPPage]
class ResendOTPRoute extends PageRouteInfo<ResendOTPRouteArgs> {
  ResendOTPRoute({
    Key? key,
    required UserModel userModel,
    List<PageRouteInfo>? children,
  }) : super(
          ResendOTPRoute.name,
          args: ResendOTPRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ResendOTPRoute';

  static const PageInfo<ResendOTPRouteArgs> page =
      PageInfo<ResendOTPRouteArgs>(name);
}

class ResendOTPRouteArgs {
  const ResendOTPRouteArgs({
    this.key,
    required this.userModel,
  });

  final Key? key;

  final UserModel userModel;

  @override
  String toString() {
    return 'ResendOTPRouteArgs{key: $key, userModel: $userModel}';
  }
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OTPPage]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    Key? key,
    UserModel? userModel,
    List<PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const PageInfo<OtpRouteArgs> page = PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    this.userModel,
  });

  final Key? key;

  final UserModel? userModel;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, userModel: $userModel}';
  }
}
