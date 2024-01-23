
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/add_memberships/presentation/add_memberships_page.dart';
import 'package:pickme/features/add_qualification/presentation/add_qualification_page.dart';
import 'package:pickme/features/add_skills/presentation/add_skills_page.dart';
import 'package:pickme/features/add_work_experience/presentation/add_work_experience_page.dart';
import 'package:pickme/features/alternative_request_details/presentation/alternative_request_details_page.dart';
import 'package:pickme/features/alternative_request_response/presentation/alternative_request_response_page.dart';
import 'package:pickme/features/alternative_reschedule_request/presentation/alternative_reschedule_request_page.dart';
import 'package:pickme/features/alternative_sent/presentation/alternative_sent_page.dart';
import 'package:pickme/features/application_sent/presentation/application_sent_page.dart';
import 'package:pickme/features/apply_for_job/presentation/apply_for_job_page.dart';
import 'package:pickme/features/apply_for_job_tool_tip/presentation/apply_for_job_tool_tip_page.dart';
import 'package:pickme/features/booking_reschedule_sent/presentation/booking_reschedule_sent_page.dart';
import 'package:pickme/features/bottom_navigation_bar/presentation/bottom_navigation_bar_page.dart';
import 'package:pickme/features/burger_menu/presentation/burger_menu_page.dart';
import 'package:pickme/features/cancel_booking/presentation/cancel_booking_page.dart';
import 'package:pickme/features/contact/presentation/contact_page.dart';
import 'package:pickme/features/edit_about_me/presentation/edit_about_me_page.dart';
import 'package:pickme/features/edit_personal_details/presentation/edit_personal_details_page.dart';
import 'package:pickme/features/edit_skills/presentation/edit_skills_page.dart';
import 'package:pickme/features/edit_work_experience/presentation/edit_work_experience_page.dart';
import 'package:pickme/features/edit_work_experience_details/presentation/edit_work_experience_details_page.dart';
import 'package:pickme/features/filters/presentation/filters_page.dart';
import 'package:pickme/features/edit_my_banking_details/presentation/edit_my_banking_details_page.dart';
import 'package:pickme/features/home/presentation/home_page.dart';
import 'package:pickme/features/job_details/presentation/job_details_page.dart';
import 'package:pickme/features/jobs/applying/all_jobs_page/presentation/all_jobs_page.dart';
import 'package:pickme/features/jobs/applying/job_list_page/presentation/job_list_page.dart';
import 'package:pickme/features/jobs/hiring/all_services/presentation/all_services_page.dart';
import 'package:pickme/features/jobs/hiring/candidate_profile_page/presentation/candidate_profile_page.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing/presentation/create_job_listing_page.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing_info/presentation/create_job_listing_info_page.dart';
import 'package:pickme/features/jobs/hiring/job_details_page/presentation/hirer_job_details_page.dart';
import 'package:pickme/features/jobs/hiring/landing_page/presentation/jobs_hiring_landing_page.dart';
import 'package:pickme/features/jobs/hiring/my_job_listings/presentation/my_job_listings_page.dart';
import 'package:pickme/features/jobs/hiring/offer_a_job/presentation/offer_a_job_page.dart';
import 'package:pickme/features/jobs/hiring/offer_sent/presentation/offer_sent_page.dart';
import 'package:pickme/features/jobs/hiring/pending_profile/presentation/pending_profile_page.dart';
import 'package:pickme/features/jobs/hiring/review_job_listing_details/presentation/review_job_listing_details_page.dart';
import 'package:pickme/features/jobs/hiring/select_existing_job_listing/presentation/select_existing_job_page.dart';
import 'package:pickme/features/jobs/hiring/service_category_candidates/presentation/service_category_candidates_page.dart';
import 'package:pickme/features/bank_details/presentation/bank_details_page.dart';
import 'package:pickme/features/final_details/presentation/final_details_page.dart';
import 'package:pickme/features/jobs/shared/domain/entities/create_job_page_job_entity.dart';
import 'package:pickme/features/my_reviews/presentation/my_reviews_page.dart';
import 'package:pickme/features/request_a_review/presentation/request_a_review.dart';
import 'package:pickme/features/review_a_user/presentation/review_a_user_page.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/features/my_banking_details/presentation/my_banking_details_page.dart';
import 'package:pickme/features/my_wallet/presentation/my_wallet_page.dart';
import 'package:pickme/features/pay_someone/presentation/pay_someone_page.dart';
import 'package:pickme/features/pay_someone_web_view/presentation/pay_someone_web_view_page.dart';
import 'package:pickme/features/profile/presentation/profile_page.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/features/landing/presentation/landing_page.dart';
import 'package:pickme/features/location/presentation/location_page.dart';
import 'package:pickme/features/membership_information/presentation/membership_information_page.dart';
import 'package:pickme/features/minimum_wage/presentation/minimum_wage_page.dart';
import 'package:pickme/features/my_bookings_upcoming/presentation/my_bookings_upcoming_page.dart';
import 'package:pickme/features/propose_alternative/presentation/propose_alternative_page.dart';
import 'package:pickme/features/qualification/presentation/qualification_page.dart';
import 'package:pickme/features/rate_and_work_times/presentation/rate_and_work_times_page.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/features/register/presentation/register_page.dart';
import 'package:pickme/features/reschedule_booking/presentation/reschedule_booking_page.dart';
import 'package:pickme/features/reschedule_request/presentation/reschedule_request_page.dart';
import 'package:pickme/features/reschedule_request_details/presentation/reschedule_request_details_page.dart';
import 'package:pickme/features/reschedule_selection_response/presentation/reschedule_selection_response_page.dart';
import 'package:pickme/features/setup_profile/presentation/setup_profile_page.dart';
import 'package:pickme/features/sign_up/presentation/sign_up_page.dart';
import 'package:pickme/features/register_account_step_1/presentation/register_account_step1_page.dart';
import 'package:pickme/features/you_are_all_setup/presentation/you_are_all_setup_page.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/enums/app_mode_enum.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/presentation/otp_page.dart';
import 'package:pickme/shared/features/resend_otp/presentation/resend_otp_page.dart';
import 'package:pickme/features/jobs/shared/domain/entities/my_job_listings_page_entity.dart';
import 'package:pickme/features/login/presentation/login_page.dart';
import 'package:pickme/features/terms_and_conditions/presentation/terms_and_conditions_page.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/presentation/jobs_landing_page.dart';

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
    AnimatedRoute(page: JobsLandingRoute.page),
    AnimatedRoute(page: JobsHiringLandingRoute.page),
    // AnimatedRoute(page: AddSkillsRoute.page),
    AnimatedRoute(page: AllServicesRoute.page),
    AnimatedRoute(page: ServiceCategoryCandidatesRoute.page),
    AnimatedRoute(page: FiltersRoute.page),
    AnimatedRoute(page: PendingProfileRoute.page),
    AnimatedRoute(page: MyJobListingsRoute.page),
    AnimatedRoute(page: CreateJobListingRoute.page),
    AnimatedRoute(page: AddSkillsRoute.page),
    AnimatedRoute(page: RateAndWorkTimesRoute.page),
    AnimatedRoute(page: MinimumWageRoute.page),
    AnimatedRoute(page: BankDetailsRoute.page),
    AnimatedRoute(page: LocationRoute.page),
    AnimatedRoute(page: FinalDetailsRoute.page),
    AnimatedRoute(page: YouAreAllSetupRoute.page),
    AnimatedRoute(page: BottomNavigationBarRoute.page),
    AnimatedRoute(page: MyBookingsUpcomingRoute.page),
    AnimatedRoute(page: JobDetailsRoute.page),
    AnimatedRoute(page: CreateJobListingInfoRoute.page),
    AnimatedRoute(page: ReviewJobListingInfoRoute.page),
    AnimatedRoute(page: HirerJobDetailsRoute.page),
    AnimatedRoute(page: CandidateProfileRoute.page),
    AnimatedRoute(page: OfferAJobRoute.page),
    AnimatedRoute(page: HirerJobDetailsRoute.page),
    AnimatedRoute(page: JobDetailsRoute.page),
    AnimatedRoute(page: HomeRoute.page),
    AnimatedRoute(page: BurgerMenuRoute.page),
    AnimatedRoute(page: SelectExistingJobRoute.page),
    AnimatedRoute(page: OfferSentRoute.page),
    AnimatedRoute(page: AllJobsRoute.page),
    AnimatedRoute(page: BurgerMenuRoute.page),
    AnimatedRoute(page: ApplyForJobRoute.page),
    AnimatedRoute(page: ApplyForJobToolTipRoute.page),
    AnimatedRoute(page: ApplicationSentRoute.page),
    AnimatedRoute(page: RescheduleBookingRoute.page),
    AnimatedRoute(page: BookingRescheduleSentRoute.page),
    AnimatedRoute(page:RescheduleRequestRoute.page),
    AnimatedRoute(page: RescheduleRequestDetailsRoute.page),
    AnimatedRoute(page: RescheduleSelectionResponseRoute.page),
    AnimatedRoute(page: ProposeAlternativeRoute.page),
    AnimatedRoute(page: AlternativeSentRoute.page),
    AnimatedRoute(page: AlternativeRescheduleRequestRoute.page),
    AnimatedRoute(page: AlternativeRequestDetailsRoute.page),
    AnimatedRoute(page: CancelBookingRoute.page),
    AnimatedRoute(page: MyWalletRoute.page),
    AnimatedRoute(page: MyBankingDetailsRoute.page),
    AnimatedRoute(page: PaySomeoneWebViewRoute.page),
    AnimatedRoute(page: EditMyBankingDetailsRoute.page),
    AnimatedRoute(page: ProfileRoute.page),
    AnimatedRoute(page: CancelBookingRoute.page),
    AnimatedRoute(page: JobListRoute.page),
    AnimatedRoute(page: MyReviewsRoute.page),
    AnimatedRoute(page: RequestAReviewRoute.page),
    AnimatedRoute(page: ReviewAUserRoute.page),
    AnimatedRoute(page: EditPersonalDetailsRoute.page),
    AnimatedRoute(page: EditAboutMeRoute.page),
    AnimatedRoute(page: EditSkillsRoute.page),
    AnimatedRoute(page: EditWorkExperienceRoute.page),
    AnimatedRoute(page: EditWorkExperienceDetailsRoute.page),
    AnimatedRoute(page: ContactRoute.page, initial: true)
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