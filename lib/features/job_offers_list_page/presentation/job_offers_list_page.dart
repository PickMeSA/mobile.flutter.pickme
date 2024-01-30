import 'package:cached_network_image/cached_network_image.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/job_offer_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

import 'bloc/job_offers_list_page_bloc.dart';


@RoutePage()
class JobOffersListPage extends BasePage {
  const JobOffersListPage({super.key,
    required this.jobRequests,
  });
  final List<JobOfferEntity> jobRequests;
  @override
  State<JobOffersListPage> createState() => _JobOffersListPageState();
}

class _JobOffersListPageState extends BasePageState<JobOffersListPage, JobOffersListBloc> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<JobOffersListBloc, JobOffersListPageState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: Column(
            children: [
              Expanded(
                child:(widget.jobRequests.isEmpty)?
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
                    itemCount: widget.jobRequests.length,
                    itemBuilder: (BuildContext context, int index){
                      JobOfferEntity job = widget.jobRequests[index];
                      return AppJobCard(
                        jobName: job.jobData.title,
                        employerName: job.customer.firstName??"",
                        locationName: job.customer.address??"",
                        dateTime: job.startDate,
                        selected: getBloc().selectedJob==job,
                        image: (job.customer.profileImage!=null)?
                        CachedNetworkImageProvider(job.customer.profileImage!):null,
                        onNext: ()=> context.router.push(JobDetailsRoute(jobId: job.jobId)),
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
  JobOffersListBloc initBloc() {
    return locator<JobOffersListBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().myJobRequests,),
    );
  }

}