import 'dart:ui';

import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/shared/domain/entities/create_job_page_job_entity.dart';
import 'package:pickme/features/jobs/shared/domain/entities/job_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/hirer_job_details_page_bloc.dart';

@RoutePage()
class HirerJobDetailsPage extends BasePage {
  const HirerJobDetailsPage({super.key, required this.jobEntity});
  final JobEntity jobEntity;

  @override
  State<HirerJobDetailsPage> createState() => _HirerJobDetailsPageState();
}

class _HirerJobDetailsPageState extends BasePageState<HirerJobDetailsPage, HirerJobDetailsPageBloc> {

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<HirerJobDetailsPageBloc, HirerJobDetailsPageState>(
      listener: (context, state) {
        //loading
        if(state is ReviewJobPageSubmitJobState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }

        //loading
        if(state is ReviewJobPageSubmitJobState && state.dataState == DataState.success){
          Navigator.pop(context); //Remove loader
        }          //loading
        if(state is ReviewJobPageSubmitJobState && state.dataState == DataState.error){
          Navigator.pop(context); //Remove loader
          //   todo: Display error
        }
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppJobDetailCard(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  jobName: widget.jobEntity.title,
                    employerName: "Andrew",
                    locationName: widget.jobEntity.address??"Melrose Arch. Johannesburg",
                    dateTime: widget.jobEntity.startDate!,
                    onNext: (){}, estimatedTime: widget.jobEntity.estimatedHours.toString(),
                  rate: "R ${widget.jobEntity.hourlyRate}",),
                16.height,
                const AppDivider(),
                24.height,
                wText(getLocalization().jobDescription, style: Theme.of(context).textTheme.headlineSmall),
                16.height,
                wText(widget.jobEntity.description),
                16.height,
                const AppDivider(),
                24.height,
                wText(getLocalization().skillsRequired, style: Theme.of(context).textTheme.headlineSmall),
                16.height,
                // ChipGroup(inputs: widget.jobEntity.skills.split(",").map((e) => ChipOption(label: e.label, id: e.id)).toList()),
                16.height,
                const AppDivider(),
                24.height,
                wText(getLocalization().photos, style: Theme.of(context).textTheme.headlineSmall),
                16.height,
                if(widget.jobEntity.images.isNotEmpty)Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Expanded(child: ImageThumbnail(
                        imagePath:  widget.jobEntity.images[0],
                      )),
                      16.width, // Add some spacing between images
                      if(widget.jobEntity.images.length == 1) Expanded(child: Container(),),
                      if(widget.jobEntity.images.length >1)Expanded(child: ImageThumbnail(
                        imagePath:  widget.jobEntity.images[1],
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  HirerJobDetailsPageBloc initBloc() {
    return locator<HirerJobDetailsPageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().reviewJobListing,),
    );
  }

}