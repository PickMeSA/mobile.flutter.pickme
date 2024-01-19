import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/applying/job_list_page/presentation/job_list_page.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/presentation/bloc/jobs_landing_page_bloc.dart';
import 'package:pickme/features/jobs/hiring/all_services/presentation/all_services_page.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

@RoutePage()
class JobsLandingPage extends BasePage {
  const JobsLandingPage({super.key});


  @override
  State<JobsLandingPage> createState() => _JobsLandingPageState();
}

class _JobsLandingPageState extends BasePageState<JobsLandingPage, JobsLandingPageBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(JobsLandingPageEnteredEvent());
  }
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<JobsLandingPageBloc, JobsLandingPageState>(
      listener: (context, state) {
      //loading GetIndustriesState
        if(state is GetTopIndustriesState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is GetTopIndustriesState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
        }
        //error
        if(state is GetTopIndustriesState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
        //   ToDo: Display Error
        }
      },
      builder: (context, state) {
        PaginatedIndustryEntity? industries = getBloc().paginatedIndustries;
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppExplorationTile(
                  title: getLocalization().exploreAllJobs,
                  onClick: ()=>context.router.push(const AllJobsRoute()),
                ),
                10.height,
                AppExplorationTile(
                  title: getLocalization().myJobRequests,
                  count: 0,
                  icon: const Icon(Iconsax.document_text_14),
                  onClick: (){},
                ),
                // 10.height,
                // AppExplorationTile(
                //   title: getLocalization().mySavedJobs,
                //   count: 0,
                //   icon: const Icon(Iconsax.archive_tick),
                //   onClick: (){},
                // ),
                40.height,
                Row(
                  children: [
                    Expanded(child: Text(
                      getLocalization().recommendedForYou,
                      style: theme.textTheme.titleMedium,
                    )),
                    TextButton(
                        onPressed: ()=> context.router.push(JobListRoute(pageMode: JobListMode.recommendedJobs)),
                        child: Row(
                          children: [
                            Text(
                              getLocalization().seeAll,
                              style: theme.textTheme.labelMedium,
                            ),
                            10.width,
                            const Icon(
                              Iconsax.arrow_right_1,
                              size: 16,
                              color: neutrals500Color,
                            )
                          ],
                        ))
                  ],
                ),
                Column(
                  children: [
                    AppJobAdvertCard.matching(
                      jobName: "Job Name",
                      employerName: "Employer Name",
                      locationName: "location Name",
                      dateTime: DateTime.now(),
                      onNext: ()=>context.router.push(JobDetailsRoute(jobId: ""))
                      ,)
                  ],
                ),
                40.height,
                Row(
                  children: [
                    Expanded(child: Text(
                      getLocalization().otherServices,
                      style: theme.textTheme.titleMedium,
                    )),
                    TextButton(
                        onPressed: ()=> context.router.push(AllServicesRoute(pageMode: ServicesPageMode.working)),
                        child: Row(
                          children: [
                            Text(
                              getLocalization().seeAll,
                              style: theme.textTheme.labelMedium,
                            ),
                            10.width,
                            const Icon(
                              Iconsax.arrow_right_1,
                              size: 16,
                              color: neutrals500Color,
                            )
                          ],
                        ))
                  ],
                ),
                if(industries!=null )Row(
                  children: [
                    Expanded(
                      child: Column(
                          children: [
                            AppSectionCard.small(
                              title: industries!.industries[0].industry,
                              color: const Color(0xFFF17E2C),
                              icon: const Icon(Iconsax.setting,
                                color: Colors.white,
                                size: 20,
                              ),
                              onClick:() => context.router.push(JobListRoute(pageMode: JobListMode.categoryJobs, categoryId: industries!.industries[0].id, pageTitle: industries!.industries[0].industry)),
                            ),
                            10.height,
                            AppSectionCard(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries!.industries[1].industry,
                              color: const Color(0xFF23A8B3),
                              onClick:() => context.router.push(JobListRoute(pageMode: JobListMode.categoryJobs, categoryId: industries!.industries[1].id, pageTitle: industries!.industries[1].industry)),
                            ),
                          ]),
                    ),
                    10.width,
                    Expanded(
                      child: Column(
                          children: [
                            AppSectionCard(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries!.industries[2].industry,
                              color: const Color(0xFF3EB62B),
                              onClick:() => context.router.push(JobListRoute(pageMode: JobListMode.categoryJobs, categoryId: industries!.industries[2].id, pageTitle: industries!.industries[2].industry)),
                            ),
                            10.height,
                            AppSectionCard.small(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries!.industries[3].industry,
                              color: const Color(0xFFF44F4E),
                              onClick:() => context.router.push(JobListRoute(pageMode: JobListMode.categoryJobs, categoryId: industries!.industries[3].id, pageTitle: industries!.industries[3].industry)),
                            ),
                          ]),
                    ),
                  ],
                )

              ],
            ),
          ),
        );
      },
    );
  }

  @override
  JobsLandingPageBloc initBloc() {
    return locator<JobsLandingPageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

}