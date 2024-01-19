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
import 'package:pickme/shared/features/otp/domain/entities/FileEntity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/candidate_profile_page_bloc.dart';

@RoutePage()
class CandidateProfilePage extends BasePage {
  const CandidateProfilePage({super.key, required this.candidateProfile});
  final CandidateProfileEntity candidateProfile;

  @override
  State<CandidateProfilePage> createState() => _CandidateProfilePageState();
}

class _CandidateProfilePageState extends BasePageState<CandidateProfilePage, CandidateProfilePageBloc> {
  @override
  void initState() {
    super.initState();
    getBloc().add(CandidateProfilePageEnteredEvent(candidateProfile: widget.candidateProfile));
  }
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    CandidateProfileEntity? profile = widget.candidateProfile;
    ProfileEntity? profileEntity = getBloc().candidateProfile;
    List<AppFileEntity> jobImages = [];
    if(profileEntity?.workExperience!=null && profileEntity!.workExperience!.isNotEmpty){
      for (var experience in profileEntity.workExperience!) {
        if(experience.files !=null){
          for(AppFileEntity file in experience.files!){
            jobImages.add(file);
          }
        }

      }
    }
    return BlocConsumer<CandidateProfilePageBloc, CandidateProfilePageState>(
        listener: (context, state) {
          //loading
          if(state is CandidateProfilePageEnteredState && state.dataState == DataState.loading){
            if(!getBloc().preloaderActive){
              getBloc().preloaderActive = true;
              preloader(context);
            }
          }

          //loading
          if(state is CandidateProfilePageEnteredState && state.dataState == DataState.success){
            Navigator.pop(context);
          }

          if(state is CandidateProfilePageEnteredState && state.dataState == DataState.error){
            Navigator.pop(context);
            wErrorPopUp(message: "failed to get candidate details", type: getLocalization().error, context: context);
          }
        },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              (profile !=null)? SingleChildScrollView(
                padding: wPagePadding(top:0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppCandidateProfile(fullName: profile.fullName,
                      jobTitle: profile.jobTitle??getLocalization().noJobDescription,
                      rating: profile.rating??0,
                      hourlyRate: "R${profile.hourlyRate} p/h",
                      seeReviewsFunction: (){},
                      image: (profile.profilePicture!=null)?
                      CachedNetworkImageProvider(
                          profile.profilePicture!
                      ):null,
                    ),
                    wText(getLocalization().aboutMe, style: Theme.of(context).textTheme.titleMedium),
                    16.height,
                    wText(profileEntity?.industry??getLocalization().noProfileDescription),
                    16.height,
                    const AppDivider(),
                    24.height,
                    wText(getLocalization().mySkills, style: Theme.of(context).textTheme.titleMedium),
                    16.height,
                    (profileEntity?.skills!=null && profileEntity!.skills!.isNotEmpty)?ChipGroup(inputs: profileEntity!.skills!.map((e) => ChipOption(label: e["skill"], id: e["id"])).toList()): const SizedBox(),
                    16.height,
                    const AppDivider(),
                    24.height,
                    wText(getLocalization().workExperience, style: Theme.of(context).textTheme.titleMedium),
                    16.height,
                    profileEntity?.workExperience!=null && profileEntity!.workExperience!.isNotEmpty?profileEntity.workExperience!.map((e) => AppProfileQualification(
                        qualification: WorkExperienceEntity(
                          qualificationType: AppQualificationType.experience,
                            name: e.title!,
                            institutionName: e.company!,
                            period: "${e.startDate?.toMonthYearString()} - ${(e.isCurrent!=null && e.isCurrent!)?'present':e.endDate?.toMonthYearString()}",
                        ))).first: const SizedBox(),
                    16.height,
                    wText(getLocalization().photos, style: Theme.of(context).textTheme.titleMedium),
                    16.height,
                    if(jobImages.isNotEmpty)Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          Expanded(child: ImageThumbnail(
                            imagePath:  jobImages[0].url,
                          )),
                          16.width, // Add some spacing between images
                          if(jobImages.length == 1) Expanded(child: Container(),),
                          if(jobImages.length >1)Expanded(child: ImageThumbnail(
                            imagePath: jobImages[1].url,
                          )),
                        ],
                      ),
                    ),
                    150.height,
                  ],
                ),
              ):SizedBox(),
              Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color and opacity
                          offset: Offset(0, -4), // Offset to control the direction of the shadow (x, y)
                          blurRadius: 4.0, // Blur radius
                          spreadRadius: 0, // Spread radius
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: PrimaryButtonDark.fullWidth(
                          child: Text(getLocalization().offerAJob),
                          onPressed: () => context.router.push(OfferAJobRoute(candidateProfileEntity: widget.candidateProfile))
                      ),
                    ),
                  )
              )
            ],
          ),
        );
      },
    );
  }

  @override
  CandidateProfilePageBloc initBloc() {
    return locator<CandidateProfilePageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().candidateProfile,),
    );
  }

}