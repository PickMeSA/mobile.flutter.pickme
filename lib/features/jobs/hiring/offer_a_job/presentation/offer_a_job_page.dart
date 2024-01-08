import 'dart:ui';

import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

import 'bloc/offer_a_job_bloc.dart';

@RoutePage()
class OfferAJobPage extends BasePage {
  const OfferAJobPage({super.key, required this.candidateProfileEntity});
  final CandidateProfileEntity candidateProfileEntity;

  @override
  State<OfferAJobPage> createState() => _OfferAJobPageState();
}

class _OfferAJobPageState extends BasePageState<OfferAJobPage, OfferAJobBloc> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<OfferAJobBloc, OfferAJobState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(state.dataState == DataState.loading) const Center(
                child: Text("Loading..."),
              ),
              Text(getLocalization().whenOfferingAJobToACandidateLongText),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppOfferJobCard(
                    text: getLocalization().selectAnExistingJobListing,
                    selected: getBloc().selectedOfferType == "existing",
                    onTap: ()=>getBloc().add(SelectedOfferTypeChangedEvent(offerType: "existing")),
                  ),
                  16.height,
                  AppCenteredDivider(text: getLocalization().or),
                  16.height,
                  AppOfferJobCard(
                    text: getLocalization().selectAnExistingJobListing,
                    selected: getBloc().selectedOfferType == "one-time",
                    onTap: ()=> getBloc().add(SelectedOfferTypeChangedEvent(offerType: "one-time")),
                  ),                ],
              )
              ),
                PrimaryButtonDark.fullWidth(onPressed: getBloc().selectedOfferType == null?null: (){
                  if(getBloc().selectedOfferType=="existing"){
                    context.router.push(SelectExistingJobRoute(candidateProfileEntity: widget.candidateProfileEntity));
                  }else{
                    context.router.push(CreateJobListingRoute(candidateToOffer: widget.candidateProfileEntity));
                  }
                }, child: Text(getLocalization().ccontinue)),
            ],
          ),
        );
      },
    );
  }

  @override
  OfferAJobBloc initBloc() {
    return locator<OfferAJobBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().offerAJob,),
    );
  }

}