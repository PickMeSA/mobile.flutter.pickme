import 'dart:ui';

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
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';

import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

import 'bloc/review_a_user_bloc.dart';

@RoutePage()
class ReviewAUserPage extends BasePage {
  const ReviewAUserPage({super.key, required this.userId});
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
          context.router.push(ReusableNotificationRoute(
              title: getLocalization().reviewSubmitted,
              message: getLocalization().thanksForReviewingThisUser,
              button: PrimaryButtonDark.fullWidth(
                  onPressed: ()=>context.router.replace(BottomNavigationBarRoute(initialIndex: 1)),
                  child: Text(getLocalization().backToDashboard)),
              image: Image.asset("assets/man_and_woman_celebration.png")
          ));
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
        return SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            padding: wPagePadding(top: 0),
            child: (user== null)?
            Center(child: Text(getLocalization().loadingDotDot),):
            Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    AppCandidateProfile(
                      image:user?.pictureEntity?.url != null?
                      CachedNetworkImageProvider(user.pictureEntity!.url!):null,
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
                50.height,
                PrimaryButtonDark.fullWidth(
                  onPressed: getBloc().reviewText.isEmpty?null:(){
                    getBloc().add(SubmitClickedEvent(userId: widget.userId));
                  },
                  child: Text(getLocalization().submit),
                ),
                24.height,
              ],
            ),
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