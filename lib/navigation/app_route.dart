
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_memberships/presentation/add_memberships_page.dart';
import 'package:pickme/features/add_qualification/presentation/add_qualification_page.dart';
import 'package:pickme/features/add_skills/presentation/add_skills_page.dart';
import 'package:pickme/features/add_work_experience/presentation/add_work_experience_page.dart';
import 'package:pickme/features/jobs/hiring/all_services/presentation/all_services_page.dart';
import 'package:pickme/features/jobs/hiring/candidate_filters/presentation/filter_candidates_page.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing/presentation/create_job_listing_page.dart';
import 'package:pickme/features/jobs/hiring/landing_page/presentation/jobs_hiring_landing_page.dart';
import 'package:pickme/features/jobs/hiring/my_job_listings/presentation/my_job_listings_page.dart';
import 'package:pickme/features/jobs/hiring/pending_profile/presentation/pending_profile_page.dart';
import 'package:pickme/features/jobs/hiring/service_category_candidates/presentation/service_category_candidates_page.dart';
import 'package:pickme/features/bank_details/presentation/bank_details_page.dart';
import 'package:pickme/features/final_details/presentation/final_details_page.dart';
import 'package:pickme/features/landing/presentation/landing_page.dart';
import 'package:pickme/features/location/presentation/location_page.dart';
import 'package:pickme/features/membership_information/presentation/membership_information_page.dart';
import 'package:pickme/features/minimum_wage/presentation/minimum_wage_page.dart';
import 'package:pickme/features/qualification/presentation/qualification_page.dart';
import 'package:pickme/features/rate_and_work_times/presentation/rate_and_work_times_page.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/features/register/presentation/register_page.dart';
import 'package:pickme/features/setup_profile/presentation/setup_profile_page.dart';
import 'package:pickme/features/sign_up/presentation/sign_up_page.dart';
import 'package:pickme/features/register_account_step_1/presentation/register_account_step1_page.dart';
import 'package:pickme/features/you_are_all_setup/presentation/you_are_all_setup_page.dart';
import 'package:pickme/shared/features/otp/presentation/otp_page.dart';
import 'package:pickme/shared/features/resend_otp/presentation/resend_otp_page.dart';
import '../features/login/presentation/login_page.dart';
import '../features/terms_and_conditions/presentation/terms_and_conditions_page.dart';
//JOB
import '../features/jobs/applying/jobs_landing_page/presentation/jobs_landing_page.dart';

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
    AnimatedRoute(page: LoginRoute.page,),
    AnimatedRoute(page: RegisterRoute.page,),
    AnimatedRoute(page: OTPRoute.page,),
    AnimatedRoute(page: ResendOTPRoute.page,),
    AnimatedRoute(page: SetupProfileRoute.page,),
    AnimatedRoute(page: QualificationsRoute.page),
    AnimatedRoute(page: AddMembershipsRoute.page),
    AnimatedRoute(page: AddWorkExperienceRoute.page),
    AnimatedRoute(page: AddQualificationRoute.page),
    AnimatedRoute(page: RegisterAccountStep1Route.page,),
    AnimatedRoute(page: TermsAndConditionsRoute.page,),
    AnimatedRoute(page: MembershipInformationRoute.page,),
    AnimatedRoute(page: JobsLandingRoute.page,),
    AnimatedRoute(page: JobsHiringLandingRoute.page,),
    // AnimatedRoute(page: AddSkillsRoute.page),
    AnimatedRoute(page: AllServicesRoute.page),
    AnimatedRoute(page: ServiceCategoryCandidatesRoute.page),
    AnimatedRoute(page: FilterCandidatesRoute.page),
    AnimatedRoute(page: PendingProfileRoute.page),
    AnimatedRoute(page: MyJobListingsRoute.page),
    AnimatedRoute(page: CreateJobListingRoute.page),
    AnimatedRoute(page: AddSkillsRoute.page),
    AnimatedRoute(page:RateAndWorkTimesRoute.page),
    AnimatedRoute(page: MinimumWageRoute.page),
    AnimatedRoute(page: BankDetailsRoute.page),
    AnimatedRoute(page: LocationRoute.page),
    AnimatedRoute(page: FinalDetailsRoute.page),
    AnimatedRoute(page: YouAreAllSetupRoute.page)

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