import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

import 'package:pickme/shared/domain/entities/my_job_listings_page_entity.dart';
import 'bloc/my_job_listings_bloc.dart';

@RoutePage()
class MyJobListingsPage extends BasePage {
  const MyJobListingsPage({super.key, this.jobListingsPageEntity, });
  final MyJobListingsPageEntity? jobListingsPageEntity;
  @override
  State<MyJobListingsPage> createState() => _MyJobListingsPageState();
}

class _MyJobListingsPageState extends BasePageState<MyJobListingsPage, MyJobListingsBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(MyJobListingsPageEnteredEvent(jobListingsPageEntity:widget.jobListingsPageEntity));
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<MyJobListingsBloc, MyJobListingsState>(
      listener: (context, state) {
        //loading
        if(state is MyJobListingsPageEnteredState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }

        //loading
        if(state is MyJobListingsPageEnteredState && state.dataState == DataState.success){
          Navigator.pop(context); //Remove loader
        }          //loading
        if(state is MyJobListingsPageEnteredState && state.dataState == DataState.error){
          Navigator.pop(context); //Remove loader
          //   todo: Display error
        }
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppExplorationTile(
                  icon: const Icon(Iconsax.add),
                  showNextIcon: false,
                  title: getLocalization().createANewJobListing,
                  onClick: () => context.router.push(const CreateJobListingInfoRoute()),
                ),
                24.height,
                AppTabBar(
                  viewHeight: MediaQuery.sizeOf(context).height - 355,
                  initialIndex: getBloc().selectedTabIndex,
                  tabs: [
                    Text(getLocalization().activeListings),
                    Text(getLocalization().inactiveListings),
                  ],
                  views: [
                    if(getBloc().myJobs== null || getBloc().myJobs!.activeJobs.isEmpty)Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 200,
                          width: 200,
                          child: Image(
                            image: AssetImage("assets/no_items_found.png"),
                          ),
                        ),
                        24.height,
                        Text(getLocalization().youDontHaveAnyActiveListings,
                          style: theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    if(getBloc().myJobs!= null && getBloc().myJobs!.activeJobs.isNotEmpty) SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: getBloc().myJobs!.activeJobs.length,
                          itemBuilder: (BuildContext context, int index){
                            JobEntity job = getBloc().myJobs!.activeJobs[index];
                            return AppJobAdvertCard(
                                jobName: job.title!,
                                employerName: "${job.customer!.firstName} ${job.customer!.surname}",
                                locationName: "${job.customer!.address}",
                                dateTime: job.startDate!,
                                status: JobStatus.active,
                                onNext: ()=>context.router.push(HirerJobDetailsRoute(jobEntity: job)),
                              totalMatches: 0,
                              matchesString: "possible Matches",
                              totalApplications: 0,
                              applicationsString: "applications",
                              image: (job.customer?.profileImage!=null)?
                            CachedNetworkImageProvider(job.customer!.profileImage!):null,
                            );
                          }
                      ),
                    ),
                    if(getBloc().myJobs== null || getBloc().myJobs!.inactiveJobs.isEmpty)Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 160,
                          width: 160,
                          child: Image(
                            image: AssetImage("assets/no_items_found.png"),
                          ),
                        ),
                        24.height,
                        Text(getLocalization().youDontHaveAnyInactiveListings,
                          style: theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    if(getBloc().myJobs!= null && getBloc().myJobs!.inactiveJobs.isNotEmpty) SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: getBloc().myJobs!.inactiveJobs.length,
                          itemBuilder: (BuildContext context, int index){
                            JobEntity job = getBloc().myJobs!.inactiveJobs[index];
                            return AppJobCard(
                                jobName: job.title!,
                                employerName: "${job.customer!.firstName} ${job.customer!.surname}",
                                locationName: "${job.customer!.address}",
                                dateTime: job.startDate??DateTime.now(),
                                status: JobStatus.inactive,
                              image: (job.customer?.profileImage!=null)?
                              CachedNetworkImageProvider(job.customer!.profileImage!):null,
                              onNext: (){
                                  logger.i(job.title);
                                  context.router.push(HirerJobDetailsRoute(jobEntity: job));
                                  },
                            );
                          }
                      ),
                    )], onTap: (int index) => getBloc().add(SelectedTabChangedEvent(tabIndex: index)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  MyJobListingsBloc initBloc() {
    return locator<MyJobListingsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().myJobListings,),
    );
  }

}