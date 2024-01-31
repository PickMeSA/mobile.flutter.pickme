import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/jobs_hiring_landing_page_bloc.dart';

@RoutePage()
class JobsHiringLandingPage extends BasePage {
  const JobsHiringLandingPage({super.key});


  @override
  State<JobsHiringLandingPage> createState() => _JobsHiringLandingPageState();
}

class _JobsHiringLandingPageState extends BasePageState<JobsHiringLandingPage, JobsHiringLandingPageBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(JobsHiringLandingPageEnteredEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<JobsHiringLandingPageBloc, JobsHiringLandingPageState>(
      listener: (context, state) {
        if(state is JobsHiringLandingPageInitial && state.dataState == DataState.success){
        }

        //error
        if(state is JobsHiringLandingPageInitial && state.dataState == DataState.error){
          // error dialog
        }

        if(state is GetTopIndustriesState && state.dataState == DataState.error){
          Navigator.of(context, rootNavigator: true).pop();
          wErrorPopUp(message: "An error occurred while fetching your data.", type: getLocalization().error, context: context);
        }
        //loading
        if(state is GetTopIndustriesState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is GetTopIndustriesState && state.dataState == DataState.success){
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
      builder: (context, state) {
        PaginatedIndustryEntity? industries = state.paginatedIndustries;

        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppExplorationTile(
                  title: getLocalization().exploreAllServices,
                  onClick: () => context.router.push(AllServicesRoute()),
                ),
                10.height,
                AppExplorationTile(
                  title: getLocalization().myJobListings,
                  count: getBloc().jobCount,
                  icon: const Icon(Iconsax.document_text_14),
                  onClick: ()=>context.router.push(MyJobListingsRoute(jobListingsPageEntity: getBloc().jobListingsPageEntity)),
                ),
                40.height,
                Row(
                  children: [
                    Expanded(child: Text(
                      getLocalization().services,
                      style: theme.textTheme.titleMedium,
                    )),
                    TextButton(
                        onPressed: () => context.router.push(AllServicesRoute()),
                        child: Row(
                          children: [
                            Text(
                              getLocalization().seeAll,
                              style: theme.textTheme.labelMedium,
                            ),
                            10.width,
                            const Icon(
                              Iconsax.arrow_right_1,
                              size: 16,
                              color: neutrals500Color,
                            )
                          ],
                        ))
                  ],
                ),
                if(state.paginatedIndustries!=null)Row(
                  children: [
                    Expanded(
                      child: Column(
                          children: [
                            AppSectionCard.small(
                                title: industries!.industries[0].industry!,
                                color: const Color(0xFFF17E2C),
                                icon: const Icon(Iconsax.setting,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              onClick:() => context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: industries.industries[0].id.toString())),
                            ),
                            10.height,
                            AppSectionCard(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries.industries[1].industry!,
                              color: const Color(0xFF23A8B3),
                              onClick:() => context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: industries.industries[1].id.toString())),
                            ),
                          ]),
                    ),
                    10.width,
                    Expanded(
                      child: Column(
                          children: [
                            AppSectionCard(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries.industries[2].industry!,
                              color: const Color(0xFF3EB62B),
                              onClick:() => context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: industries.industries[2].id.toString())),
                            ),
                            10.height,
                            AppSectionCard.small(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries.industries[3].industry!,
                              color: const Color(0xFFF44F4E),
                              onClick:() => context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: industries.industries[3].id.toString())),
                            ),
                          ]),
                    ),
                  ],
                ),
                40.height,
                Row(
                  children: [
                    Expanded(child: Text(
                      getLocalization().inYourArea,
                      style: theme.textTheme.titleMedium,
                    )),
                    TextButton(
                        onPressed: () => context.router.push(AllServicesRoute()),
                        child: Row(
                          children: [
                            Text(
                              getLocalization().seeAll,
                              style: theme.textTheme.labelMedium,
                            ),
                            10.width,
                            const Icon(
                              Iconsax.arrow_right_1,
                              size: 16,
                              color: neutrals500Color,
                            )
                          ],
                        ))
                  ],
                ),
                20.height,
                SizedBox(
                  child: (state.paginatedCandidates!=null)?
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: (state.paginatedCandidates!.candidates.length>3)?3:state.paginatedCandidates!.candidates.length,
                    itemBuilder: (BuildContext context, int index){
                      CandidateProfileEntity candidate = state.paginatedCandidates!.candidates[index];
                      return AppCandidateProfile(
                        fullName: candidate.fullName,
                        jobTitle: candidate.jobTitle?? getLocalization().noJobDescription,
                        rating: candidate.rating??0,
                        hourlyRate: "R${candidate.hourlyRate}p/h",
                        image: (candidate.profilePicture!=null)?
                        CachedNetworkImageProvider(
                            candidate.profilePicture!
                        ):null,
                        viewProfileFunction: (){
                          context.router.push(CandidateProfileRoute(candidateProfile: candidate));
                        },
                      );
                    },
                  ):SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  JobsHiringLandingPageBloc initBloc() {
    return locator<JobsHiringLandingPageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title:   wText(getLocalization().services),
      leading: const Icon(Iconsax.briefcase),
      actions: [
        TextButton(onPressed: ()=> context.router.push(const BurgerMenuRoute()), child: SvgPicture.asset("assets/menu.svg"))
      ],
    );
  }

}