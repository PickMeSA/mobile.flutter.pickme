import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/job_list_page/presentation/job_list_page.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/w_colors.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'bloc/home_bloc.dart';

@RoutePage()
class HomePage extends BasePage {
  ProfileEntity profileEntity;

  HomePage({required this.profileEntity, required this.controller, super.key});

  final PersistentTabController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeBloc> {
  late final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  _onRefresh() async {
    final profileModel = ProfileModel(
        workPermitNumber: widget.profileEntity.workPermit,
        idNumber: widget.profileEntity.idNumber,
        emailAddress: widget.profileEntity.email,
        phoneNumber: widget.profileEntity.mobile,
        surname: widget.profileEntity.surname,
        firstName: widget.profileEntity.firstName,
        passportNumber: "");
    boxProfile.put(current, profileModel);
    getBloc().add(JobsHiringLandingPageEnteredEvent());
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    UserModel userMode = boxUser.get(current);
    ThemeData theme = Theme.of(context);
    return BlocConsumer<HomeBloc, HomePageState>(
      listener: (context, state) {
        if (state.dataState == DataState.error &&
            state is JobsHiringLandingPageEnteredState) {
          Navigator.pop(context);
          wErrorPopUp(
              message: state.error!,
              type: getLocalization().error,
              context: context);
        }

        if (state is NextAppointmentCardClickedState &&
            state.dataState == DataState.success) {
          if (state.bookingList!.isEmpty) {
            wErrorPopUp(
                message: getLocalization().youDontHaveUpcomingAppointments,
                type: getLocalization().information,
                context: context);
          } else {
            context.router.push(JobDetailsRoute(
                fromIndex: 1,
                jobId: getBloc().upcomingHireBookingsList[0].jobId,
                bookingId: getBloc().upcomingHireBookingsList[0]));
          }
        }

        if (state is NextAppointmentCardClickedState &&
            state.dataState == DataState.loading) {}

        if (state is NextAppointmentCardClickedState &&
            state.dataState == DataState.error) {
          Navigator.pop(context);
          wErrorPopUp(
              message: state.error!,
              type: getLocalization().error,
              context: context);
        }
      },
      builder: (context, state) {
        return state.dataState == DataState.init
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state.dataState == DataState.loading &&
                    state is JobsHiringLandingPageEnteredState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SmartRefresher(
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Image.asset(
                                        "assets/Vector.png",
                                      )),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Image.asset(
                                        "assets/dashboard_man.png",
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20, top: 70),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            ((widget.profileEntity.pictureEntity?.url ?? "").isEmpty)
                                                ? AppImageAvatar.small()
                                                : AppImageAvatar.small(
                                                    image: CachedNetworkImageProvider(
                                                        widget
                                                                .profileEntity
                                                                .pictureEntity!
                                                                .url ??
                                                            ""),
                                                  ),
                                            const Spacer(),
                                            TextButton(
                                                onPressed: () => context.router
                                                    .push(
                                                        const BurgerMenuRoute()),
                                                child: SvgPicture.asset(
                                                    "assets/menu.svg"))
                                          ],
                                        ),
                                        20.height,
                                        wText(
                                            getLocalization().hi(
                                                widget.profileEntity.firstName!,
                                                widget.profileEntity.surname!),
                                            style: theme.textTheme.headlineSmall
                                                ?.copyWith(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () => getBloc()
                                        .add(NextAppointmentCardClickedEvent()),
                                    child: Card(
                                      elevation: 8,
                                      child: ListTile(
                                        leading: const Icon(Iconsax.briefcase),
                                        title: wText(getLocalization()
                                            .yourNextAppointment),
                                        trailing: const Icon(
                                          Icons.arrow_forward,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  wText(getLocalization().forYou,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 230,
                                        width:
                                            (MediaQuery.sizeOf(context).width /
                                                    2) -
                                                25,
                                        child: AppSectionCard(
                                          title: getLocalization().myBookings,
                                          onClick: () =>
                                              widget.controller.jumpToTab(1),
                                          color: WColors.pickMeBlue,
                                          icon: const Icon(Iconsax.calendar,
                                              color: Colors.white, size: 20),
                                        ),
                                      ),
                                      10.width,
                                      InkWell(
                                        onTap: () => context.router
                                            .push(const MyWalletRoute()),
                                        child: SizedBox(
                                          height: 230,
                                          width: (MediaQuery.sizeOf(context)
                                                      .width /
                                                  2) -
                                              25,
                                          child: AppSectionCard(
                                            title: getLocalization().myWallet,
                                            color: theme.primaryColor,
                                            icon: const Icon(Iconsax.wallet,
                                                color: Colors.white, size: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  20.height,
                                  wText(getLocalization().myCalendar,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  30.height,
                                  Card(
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          // This trailing comma makes auto-formatting nicer for build methods.
                                          //custom icon without header
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                  child: Text(
                                                      getBloc().currentMonth,
                                                      style: theme
                                                          .textTheme.bodyMedium
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600))),
                                              Container(
                                                height: 24,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(8)),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.black)),
                                                child: InkWell(
                                                    onTap: () => getBloc().add(
                                                        CalendarMonthDecrementEvent()),
                                                    child: const Center(
                                                        child: Icon(
                                                      Icons
                                                          .arrow_back_ios_rounded,
                                                      size: 11,
                                                    ))),
                                              ),
                                              30.width,
                                              Container(
                                                height: 24,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(8)),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.black)),
                                                child: InkWell(
                                                    onTap: () => getBloc().add(
                                                        CalendarMonthIncrementEvent()),
                                                    child: const Center(
                                                        child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      size: 11,
                                                    ))),
                                              ),
                                            ],
                                          ),

                                          30.height,
                                          CalendarCarousel<Event>(
                                            onDayPressed: (date, events) {
                                              getBloc().add(
                                                  CalendarDateSelectedEvent(
                                                      dateTime: date,
                                                      events: events));
                                            },

                                            showOnlyCurrentMonthDate: false,
                                            //      firstDayOfWeek: 4,
                                            height: 270.0,
                                            selectedDateTime:
                                                getBloc().currentDate2,
                                            targetDateTime:
                                                getBloc().targetDateTime,
                                            customGridViewPhysics:
                                                const NeverScrollableScrollPhysics(),

                                            showHeader: false,
                                            selectedDayTextStyle:
                                                const TextStyle(
                                              color: Colors.white,
                                            ),
                                            minSelectedDate: getBloc()
                                                .currentDate
                                                .subtract(
                                                    const Duration(days: 360)),
                                            maxSelectedDate: getBloc()
                                                .currentDate
                                                .add(const Duration(days: 360)),
                                            onCalendarChanged: (DateTime date) {
                                              getBloc().add(
                                                  CalendarChangedEvent(
                                                      dateTime: date));
                                            },
                                            weekendTextStyle: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          //
                                        ],
                                      ),
                                    ),
                                  ),
                                  30.height,
                                  Row(
                                    children: [
                                      wText(getLocalization().inYourArea,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          userMode.type == 'work'
                                              ? context.router.push(
                                                  JobListRoute(
                                                      pageMode: JobListMode
                                                          .inYourArea,
                                                      filter: FilterEntity(
                                                          distance: 20)),
                                                )
                                              : context.router
                                                  .push(AllServicesRoute());
                                        },
                                        child: wText(getLocalization().seeAll,
                                            style: theme.textTheme.labelSmall
                                                ?.copyWith(
                                                    color: Colors.black)),
                                      ),
                                      10.width,
                                      const Icon(
                                        Icons.arrow_forward,
                                        size: 15,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                  20.height,
                                  getBloc().jobListingsPageEntity?.activeJobs !=
                                              null &&
                                          getBloc()
                                              .jobListingsPageEntity!
                                              .activeJobs
                                              .isNotEmpty &&
                                          userMode.type == 'work'
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: getBloc()
                                              .jobListingsPageEntity!
                                              .activeJobs
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (getBloc()
                                                        .jobListingsPageEntity
                                                        ?.activeJobs !=
                                                    null)
                                                  AppJobAdvertCard.matching(
                                                    jobName: getBloc()
                                                        .jobListingsPageEntity!
                                                        .activeJobs[index]
                                                        .title,
                                                    employerName:
                                                        "${getBloc().jobListingsPageEntity!.activeJobs[index].customer?.firstName} "
                                                        "${getBloc().jobListingsPageEntity!.activeJobs[index].customer?.surname}",
                                                    locationName: getBloc()
                                                            .jobListingsPageEntity!
                                                            .activeJobs[index]
                                                            .customer
                                                            ?.address ??
                                                        getLocalization()
                                                            .noAddressSpecified,
                                                    dateTime: getBloc()
                                                        .jobListingsPageEntity!
                                                        .activeJobs[index]
                                                        .startDate,
                                                    time: getBloc()
                                                        .jobListingsPageEntity!
                                                        .activeJobs[index]
                                                        .startTime,
                                                    image: (getBloc()
                                                                .jobListingsPageEntity!
                                                                .activeJobs[
                                                                    index]
                                                                .customer
                                                                ?.profileImage !=
                                                            null)
                                                        ? CachedNetworkImageProvider(
                                                            getBloc()
                                                                .jobListingsPageEntity!
                                                                .activeJobs[
                                                                    index]
                                                                .customer!
                                                                .profileImage!)
                                                        : null,
                                                    onNext: () => context.router
                                                        .push(JobDetailsRoute(
                                                            jobId: getBloc()
                                                                .jobListingsPageEntity!
                                                                .activeJobs[
                                                                    index]
                                                                .id,
                                                            job: getBloc()
                                                                    .jobListingsPageEntity!
                                                                    .activeJobs[
                                                                index])),
                                                  ),
                                                10.height
                                              ],
                                            );
                                          })
                                      : const SizedBox(),
                                  if (userMode.type == 'hire')
                                    SizedBox(
                                      child: (getBloc().paginatedCandidates !=
                                              null)
                                          ? ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: (getBloc()
                                                          .paginatedCandidates!
                                                          .candidates
                                                          .length >
                                                      3)
                                                  ? 3
                                                  : getBloc()
                                                      .paginatedCandidates!
                                                      .candidates
                                                      .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                CandidateProfileEntity
                                                    candidate = getBloc()
                                                        .paginatedCandidates!
                                                        .candidates[index];
                                                return AppCandidateProfile(
                                                  fullName: candidate.fullName,
                                                  jobTitle:
                                                      candidate.jobTitle ??
                                                          getLocalization()
                                                              .noJobDescription,
                                                  rating: candidate.rating ?? 0,
                                                  hourlyRate:
                                                      "R${candidate.hourlyRate}p/h",
                                                  image: (candidate
                                                              .profilePicture !=
                                                          null)
                                                      ? CachedNetworkImageProvider(
                                                          candidate
                                                              .profilePicture!)
                                                      : null,
                                                  viewProfileFunction: () {
                                                    context.router.push(
                                                        CandidateProfileRoute(
                                                            candidateProfile:
                                                                candidate));
                                                  },
                                                );
                                              },
                                            )
                                          : const SizedBox.shrink(),
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
      },
    );
  }

  @override
  HomeBloc initBloc() {
    return locator<HomeBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
}
