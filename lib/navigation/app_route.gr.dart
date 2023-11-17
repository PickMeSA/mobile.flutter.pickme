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
    AddMembershipsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddMembershipsPage(),
      );
    },
    AddQualificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddQualificationPage(),
      );
    },
    AddWorkExperienceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddWorkExperiencePage(),
      );
    },
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
    OTPRoute.name: (routeData) {
      final args =
          routeData.argsAs<OTPRouteArgs>(orElse: () => const OTPRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OTPPage(
          key: args.key,
          userModel: args.userModel,
          fromregister: args.fromregister,
        ),
      );
    },
    QualificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QualificationsPage(),
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
    SetupProfileRoute.name: (routeData) {
      final args = routeData.argsAs<SetupProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SetupProfilePage(
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
  };
}

/// generated route for
/// [AddMembershipsPage]
class AddMembershipsRoute extends PageRouteInfo<void> {
  const AddMembershipsRoute({List<PageRouteInfo>? children})
      : super(
          AddMembershipsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMembershipsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddQualificationPage]
class AddQualificationRoute extends PageRouteInfo<void> {
  const AddQualificationRoute({List<PageRouteInfo>? children})
      : super(
          AddQualificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddQualificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddWorkExperiencePage]
class AddWorkExperienceRoute extends PageRouteInfo<void> {
  const AddWorkExperienceRoute({List<PageRouteInfo>? children})
      : super(
          AddWorkExperienceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddWorkExperienceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [OTPPage]
class OTPRoute extends PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    Key? key,
    UserModel? userModel,
    bool? fromregister = false,
    List<PageRouteInfo>? children,
  }) : super(
          OTPRoute.name,
          args: OTPRouteArgs(
            key: key,
            userModel: userModel,
            fromregister: fromregister,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const PageInfo<OTPRouteArgs> page = PageInfo<OTPRouteArgs>(name);
}

class OTPRouteArgs {
  const OTPRouteArgs({
    this.key,
    this.userModel,
    this.fromregister = false,
  });

  final Key? key;

  final UserModel? userModel;

  final bool? fromregister;

  @override
  String toString() {
    return 'OTPRouteArgs{key: $key, userModel: $userModel, fromregister: $fromregister}';
  }
}

/// generated route for
/// [QualificationsPage]
class QualificationsRoute extends PageRouteInfo<void> {
  const QualificationsRoute({List<PageRouteInfo>? children})
      : super(
          QualificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'QualificationsRoute';

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
/// [SetupProfilePage]
class SetupProfileRoute extends PageRouteInfo<SetupProfileRouteArgs> {
  SetupProfileRoute({
    Key? key,
    required UserModel userModel,
    List<PageRouteInfo>? children,
  }) : super(
          SetupProfileRoute.name,
          args: SetupProfileRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'SetupProfileRoute';

  static const PageInfo<SetupProfileRouteArgs> page =
      PageInfo<SetupProfileRouteArgs>(name);
}

class SetupProfileRouteArgs {
  const SetupProfileRouteArgs({
    this.key,
    required this.userModel,
  });

  final Key? key;

  final UserModel userModel;

  @override
  String toString() {
    return 'SetupProfileRouteArgs{key: $key, userModel: $userModel}';
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
