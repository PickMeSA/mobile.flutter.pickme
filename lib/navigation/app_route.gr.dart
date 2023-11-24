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
    AddSkillsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddSkillsPage(),
      );
    },
    AddWorkExperienceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddWorkExperiencePage(),
      );
    },
    AllServicesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllServicesPage(),
      );
    },
    FilterCandidatesRoute.name: (routeData) {
      final args = routeData.argsAs<FilterCandidatesRouteArgs>(
          orElse: () => const FilterCandidatesRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FilterCandidatesPage(
          key: args.key,
          serviceCategoryId: args.serviceCategoryId,
        ),
      );
    },
    JobsHiringLandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JobsHiringLandingPage(),
      );
    },
    JobsLandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JobsLandingPage(),
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
    MembershipInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MembershipInformationPage(),
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
    RateAndWorkTimesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RateAndWorkTimesPage(),
      );
    },
    RegisterAccountStep1Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterAccountStep1Page(),
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
    ServiceCategoryCandidatesRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceCategoryCandidatesRouteArgs>(
          orElse: () => const ServiceCategoryCandidatesRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ServiceCategoryCandidatesPage(
          key: args.key,
          serviceCategoryId: args.serviceCategoryId,
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
    SkillsAndIndustryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SkillsAndIndustryPage(),
      );
    },
    TermsAndConditionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsAndConditionsPage(),
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
/// [AddSkillsPage]
class AddSkillsRoute extends PageRouteInfo<void> {
  const AddSkillsRoute({List<PageRouteInfo>? children})
      : super(
          AddSkillsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddSkillsRoute';

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
/// [AllServicesPage]
class AllServicesRoute extends PageRouteInfo<void> {
  const AllServicesRoute({List<PageRouteInfo>? children})
      : super(
          AllServicesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllServicesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FilterCandidatesPage]
class FilterCandidatesRoute extends PageRouteInfo<FilterCandidatesRouteArgs> {
  FilterCandidatesRoute({
    Key? key,
    String? serviceCategoryId,
    List<PageRouteInfo>? children,
  }) : super(
          FilterCandidatesRoute.name,
          args: FilterCandidatesRouteArgs(
            key: key,
            serviceCategoryId: serviceCategoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'FilterCandidatesRoute';

  static const PageInfo<FilterCandidatesRouteArgs> page =
      PageInfo<FilterCandidatesRouteArgs>(name);
}

class FilterCandidatesRouteArgs {
  const FilterCandidatesRouteArgs({
    this.key,
    this.serviceCategoryId,
  });

  final Key? key;

  final String? serviceCategoryId;

  @override
  String toString() {
    return 'FilterCandidatesRouteArgs{key: $key, serviceCategoryId: $serviceCategoryId}';
  }
}

/// generated route for
/// [JobsHiringLandingPage]
class JobsHiringLandingRoute extends PageRouteInfo<void> {
  const JobsHiringLandingRoute({List<PageRouteInfo>? children})
      : super(
          JobsHiringLandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobsHiringLandingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobsLandingPage]
class JobsLandingRoute extends PageRouteInfo<void> {
  const JobsLandingRoute({List<PageRouteInfo>? children})
      : super(
          JobsLandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobsLandingRoute';

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
/// [MembershipInformationPage]
class MembershipInformationRoute extends PageRouteInfo<void> {
  const MembershipInformationRoute({List<PageRouteInfo>? children})
      : super(
          MembershipInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MembershipInformationRoute';

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
/// [RateAndWorkTimesPage]
class RateAndWorkTimesRoute extends PageRouteInfo<void> {
  const RateAndWorkTimesRoute({List<PageRouteInfo>? children})
      : super(
          RateAndWorkTimesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RateAndWorkTimesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterAccountStep1Page]
class RegisterAccountStep1Route extends PageRouteInfo<void> {
  const RegisterAccountStep1Route({List<PageRouteInfo>? children})
      : super(
          RegisterAccountStep1Route.name,
          initialChildren: children,
        );

  static const String name = 'RegisterAccountStep1Route';

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
/// [ServiceCategoryCandidatesPage]
class ServiceCategoryCandidatesRoute
    extends PageRouteInfo<ServiceCategoryCandidatesRouteArgs> {
  ServiceCategoryCandidatesRoute({
    Key? key,
    String? serviceCategoryId,
    List<PageRouteInfo>? children,
  }) : super(
          ServiceCategoryCandidatesRoute.name,
          args: ServiceCategoryCandidatesRouteArgs(
            key: key,
            serviceCategoryId: serviceCategoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'ServiceCategoryCandidatesRoute';

  static const PageInfo<ServiceCategoryCandidatesRouteArgs> page =
      PageInfo<ServiceCategoryCandidatesRouteArgs>(name);
}

class ServiceCategoryCandidatesRouteArgs {
  const ServiceCategoryCandidatesRouteArgs({
    this.key,
    this.serviceCategoryId,
  });

  final Key? key;

  final String? serviceCategoryId;

  @override
  String toString() {
    return 'ServiceCategoryCandidatesRouteArgs{key: $key, serviceCategoryId: $serviceCategoryId}';
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

/// generated route for
/// [SkillsAndIndustryPage]
class SkillsAndIndustryRoute extends PageRouteInfo<void> {
  const SkillsAndIndustryRoute({List<PageRouteInfo>? children})
      : super(
          SkillsAndIndustryRoute.name,
          initialChildren: children,
        );

  static const String name = 'SkillsAndIndustryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsAndConditionsPage]
class TermsAndConditionsRoute extends PageRouteInfo<void> {
  const TermsAndConditionsRoute({List<PageRouteInfo>? children})
      : super(
          TermsAndConditionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsAndConditionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
