import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

import 'bloc/job_list_page_bloc.dart';

enum JobListMode { categoryJobs, recommendedJobs, inYourArea }

@RoutePage()
class JobListPage extends BasePage {
  const JobListPage({super.key,
    required this.pageMode,
    required this.filter,
    this.pageTitle,
  }):assert(
  (pageMode==JobListMode.categoryJobs && filter!=null) ||
      (pageMode!=JobListMode.categoryJobs)
  );
  final JobListMode pageMode;
  final FilterEntity filter;
  final String? pageTitle;
  @override
  State<JobListPage> createState() => _JobListPageState();
}

class _JobListPageState extends BasePageState<JobListPage, JobListBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(MyJobListingsPageEnteredEvent(filter: widget.filter, pageMode: widget.pageMode));
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<JobListBloc, JobListPageState>(
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
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }//loading
        if(state is FilterChangedState && state.dataState == DataState.loading){
          preloader(context);
        }
        //loading
        if(state is FilterChangedState && state.dataState == DataState.success){
          Navigator.pop(context); //Remove loader
        }          //loading
        if(state is FilterChangedState && state.dataState == DataState.error){
          Navigator.pop(context); //Remove loader
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
        if(state is SendJobOfferClickedState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        if(state is SendJobOfferClickedState && state.dataState == DataState.error){
          //Display error
        }
        if(state is SendJobOfferClickedState && state.dataState == DataState.success){
          context.router.popUntilRouteWithName("AllServicesRoute");
          context.router.push(const OfferSentRoute());
        }
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: Column(
            children: [
              Expanded(
                child:(getBloc().myJobs== null || getBloc().myJobs!.activeJobs.isEmpty)?
                Column(
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
                    Text(getLocalization().noJobsFound,
                      style: theme.textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    )
                  ],
                ):ListView.separated(
                  separatorBuilder: (BuildContext context, int index){
                    return SizedBox(height: 20,);
                  },
                    itemCount: getBloc().myJobs!.activeJobs.length,
                    itemBuilder: (BuildContext context, int index){
                      JobEntity job = getBloc().myJobs!.activeJobs[index];
                      return AppJobCard(
                        jobName: job.title,
                        employerName: job.customer?.firstName??"",
                        locationName: job.address??job.customer?.address??"",
                        dateTime: job.startDate,
                        time: job.startTime,
                        selected: getBloc().selectedJob==job,
                        image: (job.customer?.profileImage!=null)?
                        CachedNetworkImageProvider(job.customer!.profileImage!):null,
                        onNext: ()=> context.router.push(JobDetailsRoute(jobId: job.id)),
                      );
                    }
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  JobListBloc initBloc() {
    return locator<JobListBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    String pageTitle = getLocalization().recommendedForYou;
    if(widget.pageTitle!=null){
      pageTitle = widget.pageTitle!;
    }
    return getAppBar(
      title: Text(pageTitle,),
      actions: [
        TextButton(onPressed: () async{
          FilterEntity? filter = await context.router.push<FilterEntity>(FiltersRoute(filterEntity: getBloc().filterEntity));
          if(filter!=null){
            getBloc().add(FilterChangedEvent(filterEntity: filter));
          }
        }, child: Icon(Iconsax.candle_2, color: Theme.of(context).colorScheme.secondary,))
      ],
    );
  }

}