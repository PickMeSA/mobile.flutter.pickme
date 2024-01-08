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
    AllJobsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllJobsPage(),
      );
    },
    AllServicesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllServicesPage(),
      );
    },
    BankDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BankDetailsPage(),
      );
    },
    BottomNavigationBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavigationBarPage(),
      );
    },
    BurgerMenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BurgerMenuPage(),
      );
    },
    CandidateProfileRoute.name: (routeData) {
      final args = routeData.argsAs<CandidateProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CandidateProfilePage(
          key: args.key,
          candidateProfile: args.candidateProfile,
        ),
      );
    },
    CreateJobListingInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateJobListingInfoPage(),
      );
    },
    CreateJobListingRoute.name: (routeData) {
      final args = routeData.argsAs<CreateJobListingRouteArgs>(
          orElse: () => const CreateJobListingRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateJobListingPage(
          key: args.key,
          candidateToOffer: args.candidateToOffer,
        ),
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
    FinalDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinalDetailsPage(),
      );
    },
    HirerJobDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HirerJobDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HirerJobDetailsPage(
          key: args.key,
          jobEntity: args.jobEntity,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    JobDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JobDetailsPage(),
      );
    },
    JobListRoute.name: (routeData) {
      final args = routeData.argsAs<JobListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobListPage(
          key: args.key,
          candidateProfileEntity: args.candidateProfileEntity,
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
    LocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocationPage(),
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
    MinimumWageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MinimumWagePage(),
      );
    },
    MyBookingsUpcomingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyBookingsUpcomingPage(),
      );
    },
    MyJobListingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyJobListingsPage(),
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
    OfferAJobRoute.name: (routeData) {
      final args = routeData.argsAs<OfferAJobRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OfferAJobPage(
          key: args.key,
          candidateProfileEntity: args.candidateProfileEntity,
        ),
      );
    },
    OfferSentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OfferSentPage(),
      );
    },
    PendingProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PendingProfilePage(),
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
    ReviewJobListingInfoRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewJobListingInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReviewJobListingInfoPage(
          key: args.key,
          jobEntity: args.jobEntity,
        ),
      );
    },
    SelectExistingJobRoute.name: (routeData) {
      final args = routeData.argsAs<SelectExistingJobRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectExistingJobPage(
          key: args.key,
          candidateProfileEntity: args.candidateProfileEntity,
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetupProfilePage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    TermsAndConditionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsAndConditionsPage(),
      );
    },
    YouAreAllSetupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const YouAreAllSetupPage(),
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
/// [AllJobsPage]
class AllJobsRoute extends PageRouteInfo<void> {
  const AllJobsRoute({List<PageRouteInfo>? children})
      : super(
          AllJobsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllJobsRoute';

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
/// [BankDetailsPage]
class BankDetailsRoute extends PageRouteInfo<void> {
  const BankDetailsRoute({List<PageRouteInfo>? children})
      : super(
          BankDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomNavigationBarPage]
class BottomNavigationBarRoute extends PageRouteInfo<void> {
  const BottomNavigationBarRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BurgerMenuPage]
class BurgerMenuRoute extends PageRouteInfo<void> {
  const BurgerMenuRoute({List<PageRouteInfo>? children})
      : super(
          BurgerMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'BurgerMenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CandidateProfilePage]
class CandidateProfileRoute extends PageRouteInfo<CandidateProfileRouteArgs> {
  CandidateProfileRoute({
    Key? key,
    required CandidateProfileEntity candidateProfile,
    List<PageRouteInfo>? children,
  }) : super(
          CandidateProfileRoute.name,
          args: CandidateProfileRouteArgs(
            key: key,
            candidateProfile: candidateProfile,
          ),
          initialChildren: children,
        );

  static const String name = 'CandidateProfileRoute';

  static const PageInfo<CandidateProfileRouteArgs> page =
      PageInfo<CandidateProfileRouteArgs>(name);
}

class CandidateProfileRouteArgs {
  const CandidateProfileRouteArgs({
    this.key,
    required this.candidateProfile,
  });

  final Key? key;

  final CandidateProfileEntity candidateProfile;

  @override
  String toString() {
    return 'CandidateProfileRouteArgs{key: $key, candidateProfile: $candidateProfile}';
  }
}

/// generated route for
/// [CreateJobListingInfoPage]
class CreateJobListingInfoRoute extends PageRouteInfo<void> {
  const CreateJobListingInfoRoute({List<PageRouteInfo>? children})
      : super(
          CreateJobListingInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateJobListingInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateJobListingPage]
class CreateJobListingRoute extends PageRouteInfo<CreateJobListingRouteArgs> {
  CreateJobListingRoute({
    Key? key,
    CandidateProfileEntity? candidateToOffer,
    List<PageRouteInfo>? children,
  }) : super(
          CreateJobListingRoute.name,
          args: CreateJobListingRouteArgs(
            key: key,
            candidateToOffer: candidateToOffer,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateJobListingRoute';

  static const PageInfo<CreateJobListingRouteArgs> page =
      PageInfo<CreateJobListingRouteArgs>(name);
}

class CreateJobListingRouteArgs {
  const CreateJobListingRouteArgs({
    this.key,
    this.candidateToOffer,
  });

  final Key? key;

  final CandidateProfileEntity? candidateToOffer;

  @override
  String toString() {
    return 'CreateJobListingRouteArgs{key: $key, candidateToOffer: $candidateToOffer}';
  }
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
/// [FinalDetailsPage]
class FinalDetailsRoute extends PageRouteInfo<void> {
  const FinalDetailsRoute({List<PageRouteInfo>? children})
      : super(
          FinalDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinalDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HirerJobDetailsPage]
class HirerJobDetailsRoute extends PageRouteInfo<HirerJobDetailsRouteArgs> {
  HirerJobDetailsRoute({
    Key? key,
    required JobEntity jobEntity,
    List<PageRouteInfo>? children,
  }) : super(
          HirerJobDetailsRoute.name,
          args: HirerJobDetailsRouteArgs(
            key: key,
            jobEntity: jobEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'HirerJobDetailsRoute';

  static const PageInfo<HirerJobDetailsRouteArgs> page =
      PageInfo<HirerJobDetailsRouteArgs>(name);
}

class HirerJobDetailsRouteArgs {
  const HirerJobDetailsRouteArgs({
    this.key,
    required this.jobEntity,
  });

  final Key? key;

  final JobEntity jobEntity;

  @override
  String toString() {
    return 'HirerJobDetailsRouteArgs{key: $key, jobEntity: $jobEntity}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobDetailsPage]
class JobDetailsRoute extends PageRouteInfo<void> {
  const JobDetailsRoute({List<PageRouteInfo>? children})
      : super(
          JobDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'JobDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobListPage]
class JobListRoute extends PageRouteInfo<JobListRouteArgs> {
  JobListRoute({
    Key? key,
    required CandidateProfileEntity candidateProfileEntity,
    List<PageRouteInfo>? children,
  }) : super(
          JobListRoute.name,
          args: JobListRouteArgs(
            key: key,
            candidateProfileEntity: candidateProfileEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'JobListRoute';

  static const PageInfo<JobListRouteArgs> page =
      PageInfo<JobListRouteArgs>(name);
}

class JobListRouteArgs {
  const JobListRouteArgs({
    this.key,
    required this.candidateProfileEntity,
  });

  final Key? key;

  final CandidateProfileEntity candidateProfileEntity;

  @override
  String toString() {
    return 'JobListRouteArgs{key: $key, candidateProfileEntity: $candidateProfileEntity}';
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
/// [LocationPage]
class LocationRoute extends PageRouteInfo<void> {
  const LocationRoute({List<PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

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
/// [MinimumWagePage]
class MinimumWageRoute extends PageRouteInfo<void> {
  const MinimumWageRoute({List<PageRouteInfo>? children})
      : super(
          MinimumWageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MinimumWageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyBookingsUpcomingPage]
class MyBookingsUpcomingRoute extends PageRouteInfo<void> {
  const MyBookingsUpcomingRoute({List<PageRouteInfo>? children})
      : super(
          MyBookingsUpcomingRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyBookingsUpcomingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyJobListingsPage]
class MyJobListingsRoute extends PageRouteInfo<void> {
  const MyJobListingsRoute({List<PageRouteInfo>? children})
      : super(
          MyJobListingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyJobListingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OTPPage]
class OTPRoute extends PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    Key? key,
    UserEntity? userModel,
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

  final UserEntity? userModel;

  final bool? fromregister;

  @override
  String toString() {
    return 'OTPRouteArgs{key: $key, userModel: $userModel, fromregister: $fromregister}';
  }
}

/// generated route for
/// [OfferAJobPage]
class OfferAJobRoute extends PageRouteInfo<OfferAJobRouteArgs> {
  OfferAJobRoute({
    Key? key,
    required CandidateProfileEntity candidateProfileEntity,
    List<PageRouteInfo>? children,
  }) : super(
          OfferAJobRoute.name,
          args: OfferAJobRouteArgs(
            key: key,
            candidateProfileEntity: candidateProfileEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'OfferAJobRoute';

  static const PageInfo<OfferAJobRouteArgs> page =
      PageInfo<OfferAJobRouteArgs>(name);
}

class OfferAJobRouteArgs {
  const OfferAJobRouteArgs({
    this.key,
    required this.candidateProfileEntity,
  });

  final Key? key;

  final CandidateProfileEntity candidateProfileEntity;

  @override
  String toString() {
    return 'OfferAJobRouteArgs{key: $key, candidateProfileEntity: $candidateProfileEntity}';
  }
}

/// generated route for
/// [OfferSentPage]
class OfferSentRoute extends PageRouteInfo<void> {
  const OfferSentRoute({List<PageRouteInfo>? children})
      : super(
          OfferSentRoute.name,
          initialChildren: children,
        );

  static const String name = 'OfferSentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PendingProfilePage]
class PendingProfileRoute extends PageRouteInfo<void> {
  const PendingProfileRoute({List<PageRouteInfo>? children})
      : super(
          PendingProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendingProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
    required UserEntity userModel,
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

  final UserEntity userModel;

  @override
  String toString() {
    return 'ResendOTPRouteArgs{key: $key, userModel: $userModel}';
  }
}

/// generated route for
/// [ReviewJobListingInfoPage]
class ReviewJobListingInfoRoute
    extends PageRouteInfo<ReviewJobListingInfoRouteArgs> {
  ReviewJobListingInfoRoute({
    Key? key,
    required CreateJobPageJobEntity jobEntity,
    List<PageRouteInfo>? children,
  }) : super(
          ReviewJobListingInfoRoute.name,
          args: ReviewJobListingInfoRouteArgs(
            key: key,
            jobEntity: jobEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewJobListingInfoRoute';

  static const PageInfo<ReviewJobListingInfoRouteArgs> page =
      PageInfo<ReviewJobListingInfoRouteArgs>(name);
}

class ReviewJobListingInfoRouteArgs {
  const ReviewJobListingInfoRouteArgs({
    this.key,
    required this.jobEntity,
  });

  final Key? key;

  final CreateJobPageJobEntity jobEntity;

  @override
  String toString() {
    return 'ReviewJobListingInfoRouteArgs{key: $key, jobEntity: $jobEntity}';
  }
}

/// generated route for
/// [SelectExistingJobPage]
class SelectExistingJobRoute extends PageRouteInfo<SelectExistingJobRouteArgs> {
  SelectExistingJobRoute({
    Key? key,
    required CandidateProfileEntity candidateProfileEntity,
    List<PageRouteInfo>? children,
  }) : super(
          SelectExistingJobRoute.name,
          args: SelectExistingJobRouteArgs(
            key: key,
            candidateProfileEntity: candidateProfileEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectExistingJobRoute';

  static const PageInfo<SelectExistingJobRouteArgs> page =
      PageInfo<SelectExistingJobRouteArgs>(name);
}

class SelectExistingJobRouteArgs {
  const SelectExistingJobRouteArgs({
    this.key,
    required this.candidateProfileEntity,
  });

  final Key? key;

  final CandidateProfileEntity candidateProfileEntity;

  @override
  String toString() {
    return 'SelectExistingJobRouteArgs{key: $key, candidateProfileEntity: $candidateProfileEntity}';
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
class SetupProfileRoute extends PageRouteInfo<void> {
  const SetupProfileRoute({List<PageRouteInfo>? children})
      : super(
          SetupProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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

/// generated route for
/// [YouAreAllSetupPage]
class YouAreAllSetupRoute extends PageRouteInfo<void> {
  const YouAreAllSetupRoute({List<PageRouteInfo>? children})
      : super(
          YouAreAllSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'YouAreAllSetupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
