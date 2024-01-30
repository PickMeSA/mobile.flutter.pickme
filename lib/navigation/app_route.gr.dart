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
      final args = routeData.argsAs<AddWorkExperienceRouteArgs>(
          orElse: () => const AddWorkExperienceRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddWorkExperiencePage(key: args.key),
      );
    },
    AllJobsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AllJobsPage(),
      );
    },
    AllServicesRoute.name: (routeData) {
      final args = routeData.argsAs<AllServicesRouteArgs>(
          orElse: () => const AllServicesRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AllServicesPage(
          key: args.key,
          pageMode: args.pageMode,
        ),
      );
    },
    AlternativeRequestDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AlternativeRequestDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AlternativeRequestDetailsPage(
          bookingEntity: args.bookingEntity,
          key: args.key,
        ),
      );
    },
    AlternativeRequestResponseRoute.name: (routeData) {
      final args = routeData.argsAs<AlternativeRequestResponseRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AlternativeRequestResponsePage(
          approved: args.approved,
          booking: args.booking,
          key: args.key,
        ),
      );
    },
    AlternativeRescheduleRequestRoute.name: (routeData) {
      final args = routeData.argsAs<AlternativeRescheduleRequestRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AlternativeRescheduleRequestPage(
          bookingEntity: args.bookingEntity,
          key: args.key,
        ),
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
      final args = routeData.argsAs<ApplyForJobRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ApplyForJobPage(
          key: args.key,
          job: args.job,
        ),
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
    BookingSuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingSuccessPage(),
      );
    },
    BottomNavigationBarRoute.name: (routeData) {
      final args = routeData.argsAs<BottomNavigationBarRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BottomNavigationBarPage(
          initialIndex: args.initialIndex,
          key: args.key,
          profileEntity: args.profileEntity,
        ),
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
          booking: args.booking,
        ),
      );
    },
    CancellationDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CancellationDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CancellationDetailsPage(
          bookingEntity: args.bookingEntity,
          key: args.key,
        ),
      );
    },
    CandidateProfileRoute.name: (routeData) {
      final args = routeData.argsAs<CandidateProfileRouteArgs>();
      return AutoRoutePage<bool?>(
        routeData: routeData,
        child: CandidateProfilePage(
          key: args.key,
          candidateProfile: args.candidateProfile,
          jobInterestId: args.jobInterestId,
        ),
      );
    },
    ContactRoute.name: (routeData) {
      final args = routeData.argsAs<ContactRouteArgs>(
          orElse: () => const ContactRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContactPage(
          key: args.key,
          isHiring: args.isHiring,
          userId: args.userId,
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
    EditAboutMeRoute.name: (routeData) {
      final args = routeData.argsAs<EditAboutMeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditAboutMePage(
          profileEntity: args.profileEntity,
          key: args.key,
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
    EditPersonalDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EditPersonalDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditPersonalDetailsPage(
          profileEntity: args.profileEntity,
          key: args.key,
        ),
      );
    },
    EditPhotosOfWorkRoute.name: (routeData) {
      final args = routeData.argsAs<EditPhotosOfWorkRouteArgs>(
          orElse: () => const EditPhotosOfWorkRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditPhotosOfWorkPage(
          files: args.files,
          key: args.key,
        ),
      );
    },
    EditQualificationDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EditQualificationDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditQualificationDetailsPage(
          otpQualificationEntity: args.otpQualificationEntity,
          key: args.key,
        ),
      );
    },
    EditQualificationRoute.name: (routeData) {
      final args = routeData.argsAs<EditQualificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditQualificationPage(
          profileEntity: args.profileEntity,
          key: args.key,
        ),
      );
    },
    EditSkillsRoute.name: (routeData) {
      final args = routeData.argsAs<EditSkillsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditSkillsPage(
          profileEntity: args.profileEntity,
          key: args.key,
        ),
      );
    },
    EditWorkExperienceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EditWorkExperienceDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditWorkExperienceDetailsPage(
          otpWorkExperienceEntity: args.otpWorkExperienceEntity,
          key: args.key,
        ),
      );
    },
    EditWorkExperienceRoute.name: (routeData) {
      final args = routeData.argsAs<EditWorkExperienceRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditWorkExperiencePage(
          profileEntity: args.profileEntity,
          key: args.key,
        ),
      );
    },
    FiltersRoute.name: (routeData) {
      final args = routeData.argsAs<FiltersRouteArgs>(
          orElse: () => const FiltersRouteArgs());
      return AutoRoutePage<FilterEntity>(
        routeData: routeData,
        child: FiltersPage(
          key: args.key,
          serviceCategoryId: args.serviceCategoryId,
          filterEntity: args.filterEntity,
          appMode: args.appMode,
        ),
      );
    },
    FinalDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinalDetailsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(
          controller: args.controller,
          key: args.key,
        ),
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
          pageMode: args.pageMode,
          bookingId: args.bookingId,
          job: args.job,
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
          filter: args.filter,
          pageTitle: args.pageTitle,
        ),
      );
    },
    JobOffersListRoute.name: (routeData) {
      final args = routeData.argsAs<JobOffersListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JobOffersListPage(
          key: args.key,
          jobRequests: args.jobRequests,
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
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(key: args.key),
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
      final args = routeData.argsAs<MyJobListingsRouteArgs>(
          orElse: () => const MyJobListingsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyJobListingsPage(
          key: args.key,
          jobListingsPageEntity: args.jobListingsPageEntity,
        ),
      );
    },
    MyReviewsRoute.name: (routeData) {
      final args = routeData.argsAs<MyReviewsRouteArgs>(
          orElse: () => const MyReviewsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyReviewsPage(
          key: args.key,
          isHiring: args.isHiring,
          userId: args.userId,
        ),
      );
    },
    MyWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyWalletPage(),
      );
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OTPPage(
          verificationId: args.verificationId,
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
      final args = routeData.argsAs<PaySomeoneWebViewRouteArgs>(
          orElse: () => const PaySomeoneWebViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PaySomeoneWebViewPage(
          profileEntity: args.profileEntity,
          key: args.key,
        ),
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
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterPage(key: args.key),
      );
    },
    RequestAReviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RequestAReviewPage(),
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
          bookingEntity: args.bookingEntity,
        ),
      );
    },
    RescheduleRequestRoute.name: (routeData) {
      final args = routeData.argsAs<RescheduleRequestRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RescheduleRequestPage(
          key: args.key,
          bookingEntity: args.bookingEntity,
        ),
      );
    },
    RescheduleSelectionResponseRoute.name: (routeData) {
      final args = routeData.argsAs<RescheduleSelectionResponseRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RescheduleSelectionResponsePage(
          booking: args.booking,
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
    ReviewAUserRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewAUserRouteArgs>(
          orElse: () => const ReviewAUserRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReviewAUserPage(
          key: args.key,
          userId: args.userId,
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
      final args = routeData.argsAs<YouAreAllSetupRouteArgs>(
          orElse: () => const YouAreAllSetupRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: YouAreAllSetupPage(
          profileEntity: args.profileEntity,
          key: args.key,
        ),
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
class AddWorkExperienceRoute extends PageRouteInfo<AddWorkExperienceRouteArgs> {
  AddWorkExperienceRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddWorkExperienceRoute.name,
          args: AddWorkExperienceRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddWorkExperienceRoute';

  static const PageInfo<AddWorkExperienceRouteArgs> page =
      PageInfo<AddWorkExperienceRouteArgs>(name);
}

class AddWorkExperienceRouteArgs {
  const AddWorkExperienceRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddWorkExperienceRouteArgs{key: $key}';
  }
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
class AllServicesRoute extends PageRouteInfo<AllServicesRouteArgs> {
  AllServicesRoute({
    Key? key,
    ServicesPageMode pageMode = ServicesPageMode.hiring,
    List<PageRouteInfo>? children,
  }) : super(
          AllServicesRoute.name,
          args: AllServicesRouteArgs(
            key: key,
            pageMode: pageMode,
          ),
          initialChildren: children,
        );

  static const String name = 'AllServicesRoute';

  static const PageInfo<AllServicesRouteArgs> page =
      PageInfo<AllServicesRouteArgs>(name);
}

class AllServicesRouteArgs {
  const AllServicesRouteArgs({
    this.key,
    this.pageMode = ServicesPageMode.hiring,
  });

  final Key? key;

  final ServicesPageMode pageMode;

  @override
  String toString() {
    return 'AllServicesRouteArgs{key: $key, pageMode: $pageMode}';
  }
}

/// generated route for
/// [AlternativeRequestDetailsPage]
class AlternativeRequestDetailsRoute
    extends PageRouteInfo<AlternativeRequestDetailsRouteArgs> {
  AlternativeRequestDetailsRoute({
    required BookingEntity bookingEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AlternativeRequestDetailsRoute.name,
          args: AlternativeRequestDetailsRouteArgs(
            bookingEntity: bookingEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AlternativeRequestDetailsRoute';

  static const PageInfo<AlternativeRequestDetailsRouteArgs> page =
      PageInfo<AlternativeRequestDetailsRouteArgs>(name);
}

class AlternativeRequestDetailsRouteArgs {
  const AlternativeRequestDetailsRouteArgs({
    required this.bookingEntity,
    this.key,
  });

  final BookingEntity bookingEntity;

  final Key? key;

  @override
  String toString() {
    return 'AlternativeRequestDetailsRouteArgs{bookingEntity: $bookingEntity, key: $key}';
  }
}

/// generated route for
/// [AlternativeRequestResponsePage]
class AlternativeRequestResponseRoute
    extends PageRouteInfo<AlternativeRequestResponseRouteArgs> {
  AlternativeRequestResponseRoute({
    required bool approved,
    required BookingEntity booking,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AlternativeRequestResponseRoute.name,
          args: AlternativeRequestResponseRouteArgs(
            approved: approved,
            booking: booking,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AlternativeRequestResponseRoute';

  static const PageInfo<AlternativeRequestResponseRouteArgs> page =
      PageInfo<AlternativeRequestResponseRouteArgs>(name);
}

class AlternativeRequestResponseRouteArgs {
  const AlternativeRequestResponseRouteArgs({
    required this.approved,
    required this.booking,
    this.key,
  });

  final bool approved;

  final BookingEntity booking;

  final Key? key;

  @override
  String toString() {
    return 'AlternativeRequestResponseRouteArgs{approved: $approved, booking: $booking, key: $key}';
  }
}

/// generated route for
/// [AlternativeRescheduleRequestPage]
class AlternativeRescheduleRequestRoute
    extends PageRouteInfo<AlternativeRescheduleRequestRouteArgs> {
  AlternativeRescheduleRequestRoute({
    required BookingEntity bookingEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AlternativeRescheduleRequestRoute.name,
          args: AlternativeRescheduleRequestRouteArgs(
            bookingEntity: bookingEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AlternativeRescheduleRequestRoute';

  static const PageInfo<AlternativeRescheduleRequestRouteArgs> page =
      PageInfo<AlternativeRescheduleRequestRouteArgs>(name);
}

class AlternativeRescheduleRequestRouteArgs {
  const AlternativeRescheduleRequestRouteArgs({
    required this.bookingEntity,
    this.key,
  });

  final BookingEntity bookingEntity;

  final Key? key;

  @override
  String toString() {
    return 'AlternativeRescheduleRequestRouteArgs{bookingEntity: $bookingEntity, key: $key}';
  }
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
class ApplyForJobRoute extends PageRouteInfo<ApplyForJobRouteArgs> {
  ApplyForJobRoute({
    Key? key,
    required JobEntity job,
    List<PageRouteInfo>? children,
  }) : super(
          ApplyForJobRoute.name,
          args: ApplyForJobRouteArgs(
            key: key,
            job: job,
          ),
          initialChildren: children,
        );

  static const String name = 'ApplyForJobRoute';

  static const PageInfo<ApplyForJobRouteArgs> page =
      PageInfo<ApplyForJobRouteArgs>(name);
}

class ApplyForJobRouteArgs {
  const ApplyForJobRouteArgs({
    this.key,
    required this.job,
  });

  final Key? key;

  final JobEntity job;

  @override
  String toString() {
    return 'ApplyForJobRouteArgs{key: $key, job: $job}';
  }
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
/// [BookingSuccessPage]
class BookingSuccessRoute extends PageRouteInfo<void> {
  const BookingSuccessRoute({List<PageRouteInfo>? children})
      : super(
          BookingSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingSuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomNavigationBarPage]
class BottomNavigationBarRoute
    extends PageRouteInfo<BottomNavigationBarRouteArgs> {
  BottomNavigationBarRoute({
    int? initialIndex,
    Key? key,
    required ProfileEntity? profileEntity,
    List<PageRouteInfo>? children,
  }) : super(
          BottomNavigationBarRoute.name,
          args: BottomNavigationBarRouteArgs(
            initialIndex: initialIndex,
            key: key,
            profileEntity: profileEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'BottomNavigationBarRoute';

  static const PageInfo<BottomNavigationBarRouteArgs> page =
      PageInfo<BottomNavigationBarRouteArgs>(name);
}

class BottomNavigationBarRouteArgs {
  const BottomNavigationBarRouteArgs({
    this.initialIndex,
    this.key,
    required this.profileEntity,
  });

  final int? initialIndex;

  final Key? key;

  final ProfileEntity? profileEntity;

  @override
  String toString() {
    return 'BottomNavigationBarRouteArgs{initialIndex: $initialIndex, key: $key, profileEntity: $profileEntity}';
  }
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
    required BookingEntity booking,
    List<PageRouteInfo>? children,
  }) : super(
          CancelBookingRoute.name,
          args: CancelBookingRouteArgs(
            key: key,
            booking: booking,
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
    required this.booking,
  });

  final Key? key;

  final BookingEntity booking;

  @override
  String toString() {
    return 'CancelBookingRouteArgs{key: $key, booking: $booking}';
  }
}

/// generated route for
/// [CancellationDetailsPage]
class CancellationDetailsRoute
    extends PageRouteInfo<CancellationDetailsRouteArgs> {
  CancellationDetailsRoute({
    required BookingEntity bookingEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CancellationDetailsRoute.name,
          args: CancellationDetailsRouteArgs(
            bookingEntity: bookingEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CancellationDetailsRoute';

  static const PageInfo<CancellationDetailsRouteArgs> page =
      PageInfo<CancellationDetailsRouteArgs>(name);
}

class CancellationDetailsRouteArgs {
  const CancellationDetailsRouteArgs({
    required this.bookingEntity,
    this.key,
  });

  final BookingEntity bookingEntity;

  final Key? key;

  @override
  String toString() {
    return 'CancellationDetailsRouteArgs{bookingEntity: $bookingEntity, key: $key}';
  }
}

/// generated route for
/// [CandidateProfilePage]
class CandidateProfileRoute extends PageRouteInfo<CandidateProfileRouteArgs> {
  CandidateProfileRoute({
    Key? key,
    required CandidateProfileEntity candidateProfile,
    String? jobInterestId,
    List<PageRouteInfo>? children,
  }) : super(
          CandidateProfileRoute.name,
          args: CandidateProfileRouteArgs(
            key: key,
            candidateProfile: candidateProfile,
            jobInterestId: jobInterestId,
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
    this.jobInterestId,
  });

  final Key? key;

  final CandidateProfileEntity candidateProfile;

  final String? jobInterestId;

  @override
  String toString() {
    return 'CandidateProfileRouteArgs{key: $key, candidateProfile: $candidateProfile, jobInterestId: $jobInterestId}';
  }
}

/// generated route for
/// [ContactPage]
class ContactRoute extends PageRouteInfo<ContactRouteArgs> {
  ContactRoute({
    Key? key,
    bool isHiring = false,
    String? userId,
    List<PageRouteInfo>? children,
  }) : super(
          ContactRoute.name,
          args: ContactRouteArgs(
            key: key,
            isHiring: isHiring,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const PageInfo<ContactRouteArgs> page =
      PageInfo<ContactRouteArgs>(name);
}

class ContactRouteArgs {
  const ContactRouteArgs({
    this.key,
    this.isHiring = false,
    this.userId,
  });

  final Key? key;

  final bool isHiring;

  final String? userId;

  @override
  String toString() {
    return 'ContactRouteArgs{key: $key, isHiring: $isHiring, userId: $userId}';
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
/// [EditAboutMePage]
class EditAboutMeRoute extends PageRouteInfo<EditAboutMeRouteArgs> {
  EditAboutMeRoute({
    required ProfileEntity profileEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditAboutMeRoute.name,
          args: EditAboutMeRouteArgs(
            profileEntity: profileEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditAboutMeRoute';

  static const PageInfo<EditAboutMeRouteArgs> page =
      PageInfo<EditAboutMeRouteArgs>(name);
}

class EditAboutMeRouteArgs {
  const EditAboutMeRouteArgs({
    required this.profileEntity,
    this.key,
  });

  final ProfileEntity profileEntity;

  final Key? key;

  @override
  String toString() {
    return 'EditAboutMeRouteArgs{profileEntity: $profileEntity, key: $key}';
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
/// [EditPersonalDetailsPage]
class EditPersonalDetailsRoute
    extends PageRouteInfo<EditPersonalDetailsRouteArgs> {
  EditPersonalDetailsRoute({
    required ProfileEntity profileEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditPersonalDetailsRoute.name,
          args: EditPersonalDetailsRouteArgs(
            profileEntity: profileEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditPersonalDetailsRoute';

  static const PageInfo<EditPersonalDetailsRouteArgs> page =
      PageInfo<EditPersonalDetailsRouteArgs>(name);
}

class EditPersonalDetailsRouteArgs {
  const EditPersonalDetailsRouteArgs({
    required this.profileEntity,
    this.key,
  });

  final ProfileEntity profileEntity;

  final Key? key;

  @override
  String toString() {
    return 'EditPersonalDetailsRouteArgs{profileEntity: $profileEntity, key: $key}';
  }
}

/// generated route for
/// [EditPhotosOfWorkPage]
class EditPhotosOfWorkRoute extends PageRouteInfo<EditPhotosOfWorkRouteArgs> {
  EditPhotosOfWorkRoute({
    List<AppFileEntity>? files,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditPhotosOfWorkRoute.name,
          args: EditPhotosOfWorkRouteArgs(
            files: files,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditPhotosOfWorkRoute';

  static const PageInfo<EditPhotosOfWorkRouteArgs> page =
      PageInfo<EditPhotosOfWorkRouteArgs>(name);
}

class EditPhotosOfWorkRouteArgs {
  const EditPhotosOfWorkRouteArgs({
    this.files,
    this.key,
  });

  final List<AppFileEntity>? files;

  final Key? key;

  @override
  String toString() {
    return 'EditPhotosOfWorkRouteArgs{files: $files, key: $key}';
  }
}

/// generated route for
/// [EditQualificationDetailsPage]
class EditQualificationDetailsRoute
    extends PageRouteInfo<EditQualificationDetailsRouteArgs> {
  EditQualificationDetailsRoute({
    required OTPQualificationEntity otpQualificationEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditQualificationDetailsRoute.name,
          args: EditQualificationDetailsRouteArgs(
            otpQualificationEntity: otpQualificationEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditQualificationDetailsRoute';

  static const PageInfo<EditQualificationDetailsRouteArgs> page =
      PageInfo<EditQualificationDetailsRouteArgs>(name);
}

class EditQualificationDetailsRouteArgs {
  const EditQualificationDetailsRouteArgs({
    required this.otpQualificationEntity,
    this.key,
  });

  final OTPQualificationEntity otpQualificationEntity;

  final Key? key;

  @override
  String toString() {
    return 'EditQualificationDetailsRouteArgs{otpQualificationEntity: $otpQualificationEntity, key: $key}';
  }
}

/// generated route for
/// [EditQualificationPage]
class EditQualificationRoute extends PageRouteInfo<EditQualificationRouteArgs> {
  EditQualificationRoute({
    required ProfileEntity profileEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditQualificationRoute.name,
          args: EditQualificationRouteArgs(
            profileEntity: profileEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditQualificationRoute';

  static const PageInfo<EditQualificationRouteArgs> page =
      PageInfo<EditQualificationRouteArgs>(name);
}

class EditQualificationRouteArgs {
  const EditQualificationRouteArgs({
    required this.profileEntity,
    this.key,
  });

  final ProfileEntity profileEntity;

  final Key? key;

  @override
  String toString() {
    return 'EditQualificationRouteArgs{profileEntity: $profileEntity, key: $key}';
  }
}

/// generated route for
/// [EditSkillsPage]
class EditSkillsRoute extends PageRouteInfo<EditSkillsRouteArgs> {
  EditSkillsRoute({
    required ProfileEntity profileEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditSkillsRoute.name,
          args: EditSkillsRouteArgs(
            profileEntity: profileEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditSkillsRoute';

  static const PageInfo<EditSkillsRouteArgs> page =
      PageInfo<EditSkillsRouteArgs>(name);
}

class EditSkillsRouteArgs {
  const EditSkillsRouteArgs({
    required this.profileEntity,
    this.key,
  });

  final ProfileEntity profileEntity;

  final Key? key;

  @override
  String toString() {
    return 'EditSkillsRouteArgs{profileEntity: $profileEntity, key: $key}';
  }
}

/// generated route for
/// [EditWorkExperienceDetailsPage]
class EditWorkExperienceDetailsRoute
    extends PageRouteInfo<EditWorkExperienceDetailsRouteArgs> {
  EditWorkExperienceDetailsRoute({
    required OTPWorkExperienceEntity otpWorkExperienceEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditWorkExperienceDetailsRoute.name,
          args: EditWorkExperienceDetailsRouteArgs(
            otpWorkExperienceEntity: otpWorkExperienceEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditWorkExperienceDetailsRoute';

  static const PageInfo<EditWorkExperienceDetailsRouteArgs> page =
      PageInfo<EditWorkExperienceDetailsRouteArgs>(name);
}

class EditWorkExperienceDetailsRouteArgs {
  const EditWorkExperienceDetailsRouteArgs({
    required this.otpWorkExperienceEntity,
    this.key,
  });

  final OTPWorkExperienceEntity otpWorkExperienceEntity;

  final Key? key;

  @override
  String toString() {
    return 'EditWorkExperienceDetailsRouteArgs{otpWorkExperienceEntity: $otpWorkExperienceEntity, key: $key}';
  }
}

/// generated route for
/// [EditWorkExperiencePage]
class EditWorkExperienceRoute
    extends PageRouteInfo<EditWorkExperienceRouteArgs> {
  EditWorkExperienceRoute({
    required ProfileEntity profileEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditWorkExperienceRoute.name,
          args: EditWorkExperienceRouteArgs(
            profileEntity: profileEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditWorkExperienceRoute';

  static const PageInfo<EditWorkExperienceRouteArgs> page =
      PageInfo<EditWorkExperienceRouteArgs>(name);
}

class EditWorkExperienceRouteArgs {
  const EditWorkExperienceRouteArgs({
    required this.profileEntity,
    this.key,
  });

  final ProfileEntity profileEntity;

  final Key? key;

  @override
  String toString() {
    return 'EditWorkExperienceRouteArgs{profileEntity: $profileEntity, key: $key}';
  }
}

/// generated route for
/// [FiltersPage]
class FiltersRoute extends PageRouteInfo<FiltersRouteArgs> {
  FiltersRoute({
    Key? key,
    String? serviceCategoryId,
    FilterEntity? filterEntity,
    AppMode appMode = AppMode.working,
    List<PageRouteInfo>? children,
  }) : super(
          FiltersRoute.name,
          args: FiltersRouteArgs(
            key: key,
            serviceCategoryId: serviceCategoryId,
            filterEntity: filterEntity,
            appMode: appMode,
          ),
          initialChildren: children,
        );

  static const String name = 'FiltersRoute';

  static const PageInfo<FiltersRouteArgs> page =
      PageInfo<FiltersRouteArgs>(name);
}

class FiltersRouteArgs {
  const FiltersRouteArgs({
    this.key,
    this.serviceCategoryId,
    this.filterEntity,
    this.appMode = AppMode.working,
  });

  final Key? key;

  final String? serviceCategoryId;

  final FilterEntity? filterEntity;

  final AppMode appMode;

  @override
  String toString() {
    return 'FiltersRouteArgs{key: $key, serviceCategoryId: $serviceCategoryId, filterEntity: $filterEntity, appMode: $appMode}';
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
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required PersistentTabController controller,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            controller: controller,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    required this.controller,
    this.key,
  });

  final PersistentTabController controller;

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{controller: $controller, key: $key}';
  }
}

/// generated route for
/// [JobDetailsPage]
class JobDetailsRoute extends PageRouteInfo<JobDetailsRouteArgs> {
  JobDetailsRoute({
    Key? key,
    int? fromIndex = 0,
    required String jobId,
    PageMode pageMode = PageMode.searching,
    BookingEntity? bookingId,
    JobEntity? job,
    List<PageRouteInfo>? children,
  }) : super(
          JobDetailsRoute.name,
          args: JobDetailsRouteArgs(
            key: key,
            fromIndex: fromIndex,
            jobId: jobId,
            pageMode: pageMode,
            bookingId: bookingId,
            job: job,
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
    this.pageMode = PageMode.searching,
    this.bookingId,
    this.job,
  });

  final Key? key;

  final int? fromIndex;

  final String jobId;

  final PageMode pageMode;

  final BookingEntity? bookingId;

  final JobEntity? job;

  @override
  String toString() {
    return 'JobDetailsRouteArgs{key: $key, fromIndex: $fromIndex, jobId: $jobId, pageMode: $pageMode, bookingId: $bookingId, job: $job}';
  }
}

/// generated route for
/// [JobListPage]
class JobListRoute extends PageRouteInfo<JobListRouteArgs> {
  JobListRoute({
    Key? key,
    required JobListMode pageMode,
    required FilterEntity filter,
    String? pageTitle,
    List<PageRouteInfo>? children,
  }) : super(
          JobListRoute.name,
          args: JobListRouteArgs(
            key: key,
            pageMode: pageMode,
            filter: filter,
            pageTitle: pageTitle,
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
    required this.filter,
    this.pageTitle,
  });

  final Key? key;

  final JobListMode pageMode;

  final FilterEntity filter;

  final String? pageTitle;

  @override
  String toString() {
    return 'JobListRouteArgs{key: $key, pageMode: $pageMode, filter: $filter, pageTitle: $pageTitle}';
  }
}

/// generated route for
/// [JobOffersListPage]
class JobOffersListRoute extends PageRouteInfo<JobOffersListRouteArgs> {
  JobOffersListRoute({
    Key? key,
    required List<JobOfferEntity> jobRequests,
    List<PageRouteInfo>? children,
  }) : super(
          JobOffersListRoute.name,
          args: JobOffersListRouteArgs(
            key: key,
            jobRequests: jobRequests,
          ),
          initialChildren: children,
        );

  static const String name = 'JobOffersListRoute';

  static const PageInfo<JobOffersListRouteArgs> page =
      PageInfo<JobOffersListRouteArgs>(name);
}

class JobOffersListRouteArgs {
  const JobOffersListRouteArgs({
    this.key,
    required this.jobRequests,
  });

  final Key? key;

  final List<JobOfferEntity> jobRequests;

  @override
  String toString() {
    return 'JobOffersListRouteArgs{key: $key, jobRequests: $jobRequests}';
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
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
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
class MyJobListingsRoute extends PageRouteInfo<MyJobListingsRouteArgs> {
  MyJobListingsRoute({
    Key? key,
    MyJobListingsPageEntity? jobListingsPageEntity,
    List<PageRouteInfo>? children,
  }) : super(
          MyJobListingsRoute.name,
          args: MyJobListingsRouteArgs(
            key: key,
            jobListingsPageEntity: jobListingsPageEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'MyJobListingsRoute';

  static const PageInfo<MyJobListingsRouteArgs> page =
      PageInfo<MyJobListingsRouteArgs>(name);
}

class MyJobListingsRouteArgs {
  const MyJobListingsRouteArgs({
    this.key,
    this.jobListingsPageEntity,
  });

  final Key? key;

  final MyJobListingsPageEntity? jobListingsPageEntity;

  @override
  String toString() {
    return 'MyJobListingsRouteArgs{key: $key, jobListingsPageEntity: $jobListingsPageEntity}';
  }
}

/// generated route for
/// [MyReviewsPage]
class MyReviewsRoute extends PageRouteInfo<MyReviewsRouteArgs> {
  MyReviewsRoute({
    Key? key,
    bool isHiring = false,
    String? userId,
    List<PageRouteInfo>? children,
  }) : super(
          MyReviewsRoute.name,
          args: MyReviewsRouteArgs(
            key: key,
            isHiring: isHiring,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'MyReviewsRoute';

  static const PageInfo<MyReviewsRouteArgs> page =
      PageInfo<MyReviewsRouteArgs>(name);
}

class MyReviewsRouteArgs {
  const MyReviewsRouteArgs({
    this.key,
    this.isHiring = false,
    this.userId,
  });

  final Key? key;

  final bool isHiring;

  final String? userId;

  @override
  String toString() {
    return 'MyReviewsRouteArgs{key: $key, isHiring: $isHiring, userId: $userId}';
  }
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
    required String verificationId,
    Key? key,
    UserEntity? userModel,
    bool? fromregister = false,
    List<PageRouteInfo>? children,
  }) : super(
          OTPRoute.name,
          args: OTPRouteArgs(
            verificationId: verificationId,
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
    required this.verificationId,
    this.key,
    this.userModel,
    this.fromregister = false,
  });

  final String verificationId;

  final Key? key;

  final UserEntity? userModel;

  final bool? fromregister;

  @override
  String toString() {
    return 'OTPRouteArgs{verificationId: $verificationId, key: $key, userModel: $userModel, fromregister: $fromregister}';
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
class PaySomeoneWebViewRoute extends PageRouteInfo<PaySomeoneWebViewRouteArgs> {
  PaySomeoneWebViewRoute({
    ProfileEntity? profileEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PaySomeoneWebViewRoute.name,
          args: PaySomeoneWebViewRouteArgs(
            profileEntity: profileEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PaySomeoneWebViewRoute';

  static const PageInfo<PaySomeoneWebViewRouteArgs> page =
      PageInfo<PaySomeoneWebViewRouteArgs>(name);
}

class PaySomeoneWebViewRouteArgs {
  const PaySomeoneWebViewRouteArgs({
    this.profileEntity,
    this.key,
  });

  final ProfileEntity? profileEntity;

  final Key? key;

  @override
  String toString() {
    return 'PaySomeoneWebViewRouteArgs{profileEntity: $profileEntity, key: $key}';
  }
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
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RequestAReviewPage]
class RequestAReviewRoute extends PageRouteInfo<void> {
  const RequestAReviewRoute({List<PageRouteInfo>? children})
      : super(
          RequestAReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestAReviewRoute';

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
    required BookingEntity bookingEntity,
    List<PageRouteInfo>? children,
  }) : super(
          RescheduleRequestDetailsRoute.name,
          args: RescheduleRequestDetailsRouteArgs(
            key: key,
            bookingEntity: bookingEntity,
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
    required this.bookingEntity,
  });

  final Key? key;

  final BookingEntity bookingEntity;

  @override
  String toString() {
    return 'RescheduleRequestDetailsRouteArgs{key: $key, bookingEntity: $bookingEntity}';
  }
}

/// generated route for
/// [RescheduleRequestPage]
class RescheduleRequestRoute extends PageRouteInfo<RescheduleRequestRouteArgs> {
  RescheduleRequestRoute({
    Key? key,
    required BookingEntity bookingEntity,
    List<PageRouteInfo>? children,
  }) : super(
          RescheduleRequestRoute.name,
          args: RescheduleRequestRouteArgs(
            key: key,
            bookingEntity: bookingEntity,
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
    required this.bookingEntity,
  });

  final Key? key;

  final BookingEntity bookingEntity;

  @override
  String toString() {
    return 'RescheduleRequestRouteArgs{key: $key, bookingEntity: $bookingEntity}';
  }
}

/// generated route for
/// [RescheduleSelectionResponsePage]
class RescheduleSelectionResponseRoute
    extends PageRouteInfo<RescheduleSelectionResponseRouteArgs> {
  RescheduleSelectionResponseRoute({
    BookingEntity? booking,
    Key? key,
    required bool approved,
    List<PageRouteInfo>? children,
  }) : super(
          RescheduleSelectionResponseRoute.name,
          args: RescheduleSelectionResponseRouteArgs(
            booking: booking,
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
    this.booking,
    this.key,
    required this.approved,
  });

  final BookingEntity? booking;

  final Key? key;

  final bool approved;

  @override
  String toString() {
    return 'RescheduleSelectionResponseRouteArgs{booking: $booking, key: $key, approved: $approved}';
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
/// [ReviewAUserPage]
class ReviewAUserRoute extends PageRouteInfo<ReviewAUserRouteArgs> {
  ReviewAUserRoute({
    Key? key,
    String userId = "tzondoD4WSQQkDVr0MoZviGOr9I3",
    List<PageRouteInfo>? children,
  }) : super(
          ReviewAUserRoute.name,
          args: ReviewAUserRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewAUserRoute';

  static const PageInfo<ReviewAUserRouteArgs> page =
      PageInfo<ReviewAUserRouteArgs>(name);
}

class ReviewAUserRouteArgs {
  const ReviewAUserRouteArgs({
    this.key,
    this.userId = "tzondoD4WSQQkDVr0MoZviGOr9I3",
  });

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'ReviewAUserRouteArgs{key: $key, userId: $userId}';
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
class YouAreAllSetupRoute extends PageRouteInfo<YouAreAllSetupRouteArgs> {
  YouAreAllSetupRoute({
    ProfileEntity? profileEntity,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          YouAreAllSetupRoute.name,
          args: YouAreAllSetupRouteArgs(
            profileEntity: profileEntity,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'YouAreAllSetupRoute';

  static const PageInfo<YouAreAllSetupRouteArgs> page =
      PageInfo<YouAreAllSetupRouteArgs>(name);
}

class YouAreAllSetupRouteArgs {
  const YouAreAllSetupRouteArgs({
    this.profileEntity,
    this.key,
  });

  final ProfileEntity? profileEntity;

  final Key? key;

  @override
  String toString() {
    return 'YouAreAllSetupRouteArgs{profileEntity: $profileEntity, key: $key}';
  }
}
