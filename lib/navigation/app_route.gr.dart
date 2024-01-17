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
    AlternativeRequestDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AlternativeRequestDetailsPage(),
      );
    },
    AlternativeRequestResponseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AlternativeRequestResponsePage(),
      );
    },
    AlternativeRescheduleRequestRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AlternativeRescheduleRequestPage(),
      );
    },
    AlternativeSentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AlternativeSentPage(),
      );
    },
    ApplicationSentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ApplicationSentPage(),
      );
    },
    ApplyForJobRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ApplyForJobPage(),
      );
    },
    ApplyForJobToolTipRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ApplyForJobToolTipPage(),
      );
    },
    BankDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BankDetailsPage(),
      );
    },
    BookingRescheduleSentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingRescheduleSentPage(),
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
    CancelBookingRoute.name: (routeData) {
      final args = routeData.argsAs<CancelBookingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CancelBookingPage(
          key: args.key,
          bookingId: args.bookingId,
        ),
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
    EditMyBankingDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EditMyBankingDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditMyBankingDetailsPage(
          key: args.key,
          bankDetailsEntity: args.bankDetailsEntity,
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
      final args = routeData.argsAs<JobDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobDetailsPage(
          key: args.key,
          fromIndex: args.fromIndex,
          jobId: args.jobId,
          bookingId: args.bookingId,
        ),
      );
    },
    JobListRoute.name: (routeData) {
      final args = routeData.argsAs<JobListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobListPage(
          key: args.key,
          pageMode: args.pageMode,
          categoryId: args.categoryId,
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
    MyBankingDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyBankingDetailsPage(),
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
    MyWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyWalletPage(),
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
    PaySomeoneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaySomeonePage(),
      );
    },
    PaySomeoneWebViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaySomeoneWebViewPage(),
      );
    },
    PendingProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PendingProfilePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    ProposeAlternativeRoute.name: (routeData) {
      final args = routeData.argsAs<ProposeAlternativeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProposeAlternativePage(
          key: args.key,
          bookingId: args.bookingId,
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
    RescheduleBookingRoute.name: (routeData) {
      final args = routeData.argsAs<RescheduleBookingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RescheduleBookingPage(
          key: args.key,
          bookingId: args.bookingId,
        ),
      );
    },
    RescheduleRequestDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RescheduleRequestDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RescheduleRequestDetailsPage(
          key: args.key,
          bookingId: args.bookingId,
        ),
      );
    },
    RescheduleRequestRoute.name: (routeData) {
      final args = routeData.argsAs<RescheduleRequestRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RescheduleRequestPage(
          key: args.key,
          bookingId: args.bookingId,
        ),
      );
    },
    RescheduleSelectionResponseRoute.name: (routeData) {
      final args = routeData.argsAs<RescheduleSelectionResponseRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RescheduleSelectionResponsePage(
          key: args.key,
          approved: args.approved,
        ),
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
/// [AlternativeRequestDetailsPage]
class AlternativeRequestDetailsRoute extends PageRouteInfo<void> {
  const AlternativeRequestDetailsRoute({List<PageRouteInfo>? children})
      : super(
          AlternativeRequestDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlternativeRequestDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AlternativeRequestResponsePage]
class AlternativeRequestResponseRoute extends PageRouteInfo<void> {
  const AlternativeRequestResponseRoute({List<PageRouteInfo>? children})
      : super(
          AlternativeRequestResponseRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlternativeRequestResponseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AlternativeRescheduleRequestPage]
class AlternativeRescheduleRequestRoute extends PageRouteInfo<void> {
  const AlternativeRescheduleRequestRoute({List<PageRouteInfo>? children})
      : super(
          AlternativeRescheduleRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlternativeRescheduleRequestRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AlternativeSentPage]
class AlternativeSentRoute extends PageRouteInfo<void> {
  const AlternativeSentRoute({List<PageRouteInfo>? children})
      : super(
          AlternativeSentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlternativeSentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ApplicationSentPage]
class ApplicationSentRoute extends PageRouteInfo<void> {
  const ApplicationSentRoute({List<PageRouteInfo>? children})
      : super(
          ApplicationSentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationSentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ApplyForJobPage]
class ApplyForJobRoute extends PageRouteInfo<void> {
  const ApplyForJobRoute({List<PageRouteInfo>? children})
      : super(
          ApplyForJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplyForJobRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ApplyForJobToolTipPage]
class ApplyForJobToolTipRoute extends PageRouteInfo<void> {
  const ApplyForJobToolTipRoute({List<PageRouteInfo>? children})
      : super(
          ApplyForJobToolTipRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplyForJobToolTipRoute';

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
/// [BookingRescheduleSentPage]
class BookingRescheduleSentRoute extends PageRouteInfo<void> {
  const BookingRescheduleSentRoute({List<PageRouteInfo>? children})
      : super(
          BookingRescheduleSentRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingRescheduleSentRoute';

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
/// [CancelBookingPage]
class CancelBookingRoute extends PageRouteInfo<CancelBookingRouteArgs> {
  CancelBookingRoute({
    Key? key,
    required String bookingId,
    List<PageRouteInfo>? children,
  }) : super(
          CancelBookingRoute.name,
          args: CancelBookingRouteArgs(
            key: key,
            bookingId: bookingId,
          ),
          initialChildren: children,
        );

  static const String name = 'CancelBookingRoute';

  static const PageInfo<CancelBookingRouteArgs> page =
      PageInfo<CancelBookingRouteArgs>(name);
}

class CancelBookingRouteArgs {
  const CancelBookingRouteArgs({
    this.key,
    required this.bookingId,
  });

  final Key? key;

  final String bookingId;

  @override
  String toString() {
    return 'CancelBookingRouteArgs{key: $key, bookingId: $bookingId}';
  }
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
/// [EditMyBankingDetailsPage]
class EditMyBankingDetailsRoute
    extends PageRouteInfo<EditMyBankingDetailsRouteArgs> {
  EditMyBankingDetailsRoute({
    Key? key,
    required OTPPaymentDetailsEntity bankDetailsEntity,
    List<PageRouteInfo>? children,
  }) : super(
          EditMyBankingDetailsRoute.name,
          args: EditMyBankingDetailsRouteArgs(
            key: key,
            bankDetailsEntity: bankDetailsEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'EditMyBankingDetailsRoute';

  static const PageInfo<EditMyBankingDetailsRouteArgs> page =
      PageInfo<EditMyBankingDetailsRouteArgs>(name);
}

class EditMyBankingDetailsRouteArgs {
  const EditMyBankingDetailsRouteArgs({
    this.key,
    required this.bankDetailsEntity,
  });

  final Key? key;

  final OTPPaymentDetailsEntity bankDetailsEntity;

  @override
  String toString() {
    return 'EditMyBankingDetailsRouteArgs{key: $key, bankDetailsEntity: $bankDetailsEntity}';
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
class JobDetailsRoute extends PageRouteInfo<JobDetailsRouteArgs> {
  JobDetailsRoute({
    Key? key,
    int? fromIndex = 0,
    required String jobId,
    String? bookingId,
    List<PageRouteInfo>? children,
  }) : super(
          JobDetailsRoute.name,
          args: JobDetailsRouteArgs(
            key: key,
            fromIndex: fromIndex,
            jobId: jobId,
            bookingId: bookingId,
          ),
          initialChildren: children,
        );

  static const String name = 'JobDetailsRoute';

  static const PageInfo<JobDetailsRouteArgs> page =
      PageInfo<JobDetailsRouteArgs>(name);
}

class JobDetailsRouteArgs {
  const JobDetailsRouteArgs({
    this.key,
    this.fromIndex = 0,
    required this.jobId,
    this.bookingId,
  });

  final Key? key;

  final int? fromIndex;

  final String jobId;

  final String? bookingId;

  @override
  String toString() {
    return 'JobDetailsRouteArgs{key: $key, fromIndex: $fromIndex, jobId: $jobId, bookingId: $bookingId}';
  }
}

/// generated route for
/// [JobListPage]
class JobListRoute extends PageRouteInfo<JobListRouteArgs> {
  JobListRoute({
    Key? key,
    required JobListMode pageMode,
    String? categoryId,
    List<PageRouteInfo>? children,
  }) : super(
          JobListRoute.name,
          args: JobListRouteArgs(
            key: key,
            pageMode: pageMode,
            categoryId: categoryId,
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
    required this.pageMode,
    this.categoryId,
  });

  final Key? key;

  final JobListMode pageMode;

  final String? categoryId;

  @override
  String toString() {
    return 'JobListRouteArgs{key: $key, pageMode: $pageMode, categoryId: $categoryId}';
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
/// [MyBankingDetailsPage]
class MyBankingDetailsRoute extends PageRouteInfo<void> {
  const MyBankingDetailsRoute({List<PageRouteInfo>? children})
      : super(
          MyBankingDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyBankingDetailsRoute';

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
/// [MyWalletPage]
class MyWalletRoute extends PageRouteInfo<void> {
  const MyWalletRoute({List<PageRouteInfo>? children})
      : super(
          MyWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyWalletRoute';

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
/// [PaySomeonePage]
class PaySomeoneRoute extends PageRouteInfo<void> {
  const PaySomeoneRoute({List<PageRouteInfo>? children})
      : super(
          PaySomeoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaySomeoneRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaySomeoneWebViewPage]
class PaySomeoneWebViewRoute extends PageRouteInfo<void> {
  const PaySomeoneWebViewRoute({List<PageRouteInfo>? children})
      : super(
          PaySomeoneWebViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaySomeoneWebViewRoute';

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
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProposeAlternativePage]
class ProposeAlternativeRoute
    extends PageRouteInfo<ProposeAlternativeRouteArgs> {
  ProposeAlternativeRoute({
    Key? key,
    required String bookingId,
    List<PageRouteInfo>? children,
  }) : super(
          ProposeAlternativeRoute.name,
          args: ProposeAlternativeRouteArgs(
            key: key,
            bookingId: bookingId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProposeAlternativeRoute';

  static const PageInfo<ProposeAlternativeRouteArgs> page =
      PageInfo<ProposeAlternativeRouteArgs>(name);
}

class ProposeAlternativeRouteArgs {
  const ProposeAlternativeRouteArgs({
    this.key,
    required this.bookingId,
  });

  final Key? key;

  final String bookingId;

  @override
  String toString() {
    return 'ProposeAlternativeRouteArgs{key: $key, bookingId: $bookingId}';
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
/// [RescheduleBookingPage]
class RescheduleBookingRoute extends PageRouteInfo<RescheduleBookingRouteArgs> {
  RescheduleBookingRoute({
    Key? key,
    required String bookingId,
    List<PageRouteInfo>? children,
  }) : super(
          RescheduleBookingRoute.name,
          args: RescheduleBookingRouteArgs(
            key: key,
            bookingId: bookingId,
          ),
          initialChildren: children,
        );

  static const String name = 'RescheduleBookingRoute';

  static const PageInfo<RescheduleBookingRouteArgs> page =
      PageInfo<RescheduleBookingRouteArgs>(name);
}

class RescheduleBookingRouteArgs {
  const RescheduleBookingRouteArgs({
    this.key,
    required this.bookingId,
  });

  final Key? key;

  final String bookingId;

  @override
  String toString() {
    return 'RescheduleBookingRouteArgs{key: $key, bookingId: $bookingId}';
  }
}

/// generated route for
/// [RescheduleRequestDetailsPage]
class RescheduleRequestDetailsRoute
    extends PageRouteInfo<RescheduleRequestDetailsRouteArgs> {
  RescheduleRequestDetailsRoute({
    Key? key,
    required String bookingId,
    List<PageRouteInfo>? children,
  }) : super(
          RescheduleRequestDetailsRoute.name,
          args: RescheduleRequestDetailsRouteArgs(
            key: key,
            bookingId: bookingId,
          ),
          initialChildren: children,
        );

  static const String name = 'RescheduleRequestDetailsRoute';

  static const PageInfo<RescheduleRequestDetailsRouteArgs> page =
      PageInfo<RescheduleRequestDetailsRouteArgs>(name);
}

class RescheduleRequestDetailsRouteArgs {
  const RescheduleRequestDetailsRouteArgs({
    this.key,
    required this.bookingId,
  });

  final Key? key;

  final String bookingId;

  @override
  String toString() {
    return 'RescheduleRequestDetailsRouteArgs{key: $key, bookingId: $bookingId}';
  }
}

/// generated route for
/// [RescheduleRequestPage]
class RescheduleRequestRoute extends PageRouteInfo<RescheduleRequestRouteArgs> {
  RescheduleRequestRoute({
    Key? key,
    required String bookingId,
    List<PageRouteInfo>? children,
  }) : super(
          RescheduleRequestRoute.name,
          args: RescheduleRequestRouteArgs(
            key: key,
            bookingId: bookingId,
          ),
          initialChildren: children,
        );

  static const String name = 'RescheduleRequestRoute';

  static const PageInfo<RescheduleRequestRouteArgs> page =
      PageInfo<RescheduleRequestRouteArgs>(name);
}

class RescheduleRequestRouteArgs {
  const RescheduleRequestRouteArgs({
    this.key,
    required this.bookingId,
  });

  final Key? key;

  final String bookingId;

  @override
  String toString() {
    return 'RescheduleRequestRouteArgs{key: $key, bookingId: $bookingId}';
  }
}

/// generated route for
/// [RescheduleSelectionResponsePage]
class RescheduleSelectionResponseRoute
    extends PageRouteInfo<RescheduleSelectionResponseRouteArgs> {
  RescheduleSelectionResponseRoute({
    Key? key,
    required bool approved,
    List<PageRouteInfo>? children,
  }) : super(
          RescheduleSelectionResponseRoute.name,
          args: RescheduleSelectionResponseRouteArgs(
            key: key,
            approved: approved,
          ),
          initialChildren: children,
        );

  static const String name = 'RescheduleSelectionResponseRoute';

  static const PageInfo<RescheduleSelectionResponseRouteArgs> page =
      PageInfo<RescheduleSelectionResponseRouteArgs>(name);
}

class RescheduleSelectionResponseRouteArgs {
  const RescheduleSelectionResponseRouteArgs({
    this.key,
    required this.approved,
  });

  final Key? key;

  final bool approved;

  @override
  String toString() {
    return 'RescheduleSelectionResponseRouteArgs{key: $key, approved: $approved}';
  }
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
