import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
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
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    CandidateProfileEntity profile = widget.candidateProfile;
    List<String> jobImages = (profile.photos==null || profile.photos =="")?[]:profile.photos!.split(",");

    return BlocConsumer<CandidateProfilePageBloc, CandidateProfilePageState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              SingleChildScrollView(
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
                    wText(profile.about??getLocalization().noProfileDescription),
                    16.height,
                    const AppDivider(),
                    24.height,
                    wText(getLocalization().mySkills, style: Theme.of(context).textTheme.titleMedium),
                    16.height,
                    profile.skills!=null && profile.skills!.isNotEmpty?ChipGroup(inputs: profile.skills!.split(",").map((e) => ChipOption(label: e, id: 0)).toList()): const SizedBox(),
                    16.height,
                    const AppDivider(),
                    24.height,
                    wText(getLocalization().workExperience, style: Theme.of(context).textTheme.titleMedium),
                    16.height,
                    profile.workExperience!=null && profile.workExperience!.isNotEmpty?profile.workExperience!.map((e) => AppProfileQualification(
                        qualification: e)).first: const SizedBox(),
                    16.height,
                    wText(getLocalization().photos, style: Theme.of(context).textTheme.titleMedium),
                    16.height,
                    if(jobImages.isNotEmpty)Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          Expanded(child: ImageThumbnail(
                            imagePath:  jobImages[0],
                          )),
                          16.width, // Add some spacing between images
                          if(jobImages.length == 1) Expanded(child: Container(),),
                          if(jobImages.length >1)Expanded(child: ImageThumbnail(
                            imagePath: jobImages[1],
                          )),
                        ],
                      ),
                    ),
                    150.height,
                  ],
                ),
              ),
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