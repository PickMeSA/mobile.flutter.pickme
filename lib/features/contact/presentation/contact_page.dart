import 'dart:ui';

import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/review_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';

import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

import 'bloc/contact_bloc.dart';

@RoutePage()
class ContactPage extends BasePage {
  const ContactPage({super.key, this.isHiring=false, this.userId}) : assert(isHiring==false || (isHiring==true && userId!=null));
  final bool isHiring;
  final String? userId;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends BasePageState<ContactPage, ContactPageBloc> {
  @override
  void initState() {
    super.initState();
    getBloc().add(ContactPageEnteredEvent(userId: widget.userId));
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<ContactPageBloc, ContactPageState>(
      listener: (context, state) {
        //loading GetIndustriesState
        if(state is GetPageDataState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is GetPageDataState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
        }
        //loading
        if(state is GetPageDataState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: "Error", context: context);
        }
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (getBloc().pageEntity== null || getBloc().pageEntity!.reviews.isEmpty)?
              Expanded(
                  child: Column(
                    children: [
                      Expanded(child: Column(
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
                          Text(getLocalization().youDontHaveAnyReviewsYet,
                            style: theme.textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          16.height,
                          Text(getLocalization().getReviewsToBoostProfile,
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          24.height,
                        ],
                      )),
                      PrimaryButton.fullWidth(
                        onPressed: ()=>context.router.push(RequestAReviewRoute()),
                        child: Text(getLocalization().requestAReview),
                      ),
                      16.height
                    ],
                  )):
                Expanded(
                child: ListView.separated(
                  itemCount: getBloc().pageEntity!.reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    ReviewEntity review = getBloc().pageEntity!.reviews[index];
                    return AppProfileReview(
                      fullName: "${review.reviewer?.firstName} ${review.reviewer?.surname}",
                      rating: review.rating,
                      relationship: review.reviewer!.industry?.industry??getLocalization().noIndustrySpecified,
                      reviewDate: review.createdAt,
                      review: review.review,
                      // : ()=>context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: getBloc().pageEntity!.reviews[index].id)),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: AppDivider(),
                    );
                  },
                ),
              )

            ],
          ),
        );
      },
    );
  }

  @override
  ContactPageBloc initBloc() {
    return locator<ContactPageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(widget.isHiring?getLocalization().reviews:getLocalization().myReviews),
      actions: widget.isHiring?null:[
        TertiaryButton(
          onPressed: (){},
          child: Text(getLocalization().requestAReview),)
      ]
    );
  }


}