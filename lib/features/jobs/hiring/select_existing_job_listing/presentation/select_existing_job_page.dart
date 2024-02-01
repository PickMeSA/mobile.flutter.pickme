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
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

import 'bloc/select_existing_job_listing_bloc.dart';

@RoutePage()
class SelectExistingJobPage extends BasePage {
  const SelectExistingJobPage({super.key, required this.candidateProfileEntity});
  final CandidateProfileEntity candidateProfileEntity;

  @override
  State<SelectExistingJobPage> createState() => _MyJobListingsPageState();
}

class _MyJobListingsPageState extends BasePageState<SelectExistingJobPage, SelectExistingJobBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(MyJobListingsPageEnteredEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<SelectExistingJobBloc, SelectExistingJobState>(
      listener: (context, state) {
        //loading
        if(state is SelectExistingJobPageEnteredState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }

        //loading
        if(state is SelectExistingJobPageEnteredState && state.dataState == DataState.success){
          Navigator.pop(context); //Remove loader
        }          //loading
        if(state is SelectExistingJobPageEnteredState && state.dataState == DataState.error){
          Navigator.pop(context); //Remove loader
          //   todo: Display error
        }

        if(state is SendJobOfferClickedState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        if(state is SendJobOfferClickedState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
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
                    Text(getLocalization().youDontHaveAnyActiveListings,
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
                        jobName: job.title!,
                        employerName: "${job.customer!.firstName!} ${job.customer!.surname!}",
                        locationName: job.customer!.address??"no location specified",
                        dateTime: job.startDate!,
                        selected: getBloc().selectedJob==job,
                        onClick: ()=>getBloc().add(JobSelectedEvent(job: job)),
                      );
                    }
                ),
              ),
              PrimaryButton.fullWidth(onPressed: getBloc().selectedJob == null?null: (){
                getBloc().add(SendJobOfferClickedEvent(candidateProfileEntity: widget.candidateProfileEntity));
              }, child: Text(getLocalization().sendJobOffer)),
            ],
          ),
        );
      },
    );
  }

  @override
  SelectExistingJobBloc initBloc() {
    return locator<SelectExistingJobBloc>();
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