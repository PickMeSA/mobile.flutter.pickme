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
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/review_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';

import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

import 'bloc/review_a_user_bloc.dart';

@RoutePage()
class ReviewAUserPage extends BasePage {
  const ReviewAUserPage({super.key, this.userId = "tzondoD4WSQQkDVr0MoZviGOr9I3"});
  final String userId;

  @override
  State<ReviewAUserPage> createState() => _ReviewAUserPageState();
}

class _ReviewAUserPageState extends BasePageState<ReviewAUserPage, ReviewAUserBloc> {
  TextEditingController reviewTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getBloc().add(ReviewAUserPageEnteredEvent(userId: widget.userId));
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<ReviewAUserBloc, ReviewAUserState>(
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
        }//loading GetIndustriesState
        if(state is RatingChangedState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is RatingChangedState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
        }
        //loading
        if(state is RatingChangedState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: "Error", context: context);
        }
        logger.e(state is SubmitClickedState);
        if(state is SubmitClickedState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is SubmitClickedState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
        }
        //loading
        if(state is SubmitClickedState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: "Error", context: context);
        }
      },
      builder: (context, state) {
        ProfileEntity? user = getBloc().pageEntity?.user;
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top: 0),
          child: (user== null)?
          Center(child: Text(getLocalization().loadingDotDot),): Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  AppCandidateProfile(
                      fullName: "${user.firstName} ${user.surname}",
                      jobTitle:  user.industry?.industry??"",
                      rating: user.averageRating??0,
                      hourlyRate: null),
                  Text("${getLocalization().howWouldYouRate} ${user.firstName}?", style: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  24.height,
                  AppStarRating(
                    rating: getBloc().rating,
                    onChanged: (int value){
                      getBloc().add(RatingChangedEvent(value: value));
                    },
                  ),
                    24.height,
                    AppTextField(
                    textFieldType: TextFieldType.MULTILINE,
                    controller: reviewTextController,
                      onChanged: (String text){
                        getBloc().add(ReviewTextChangedEvent(value: text));
                      },
                  )
                ],
                ),
              ),
              PrimaryButtonDark.fullWidth(
                onPressed: getBloc().reviewText.isEmpty?null:(){
                  getBloc().add(SubmitClickedEvent(userId: widget.userId));
                },
                child: Text(getLocalization().submit),
              ),
              24.height,
            ],
          ),
        );
      },
    );
  }

  @override
  ReviewAUserBloc initBloc() {
    return locator<ReviewAUserBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().review),
    );
  }


}