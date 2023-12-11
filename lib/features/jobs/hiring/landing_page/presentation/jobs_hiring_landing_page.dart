import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/hiring/landing_page/presentation/bloc/jobs_hiring_landing_page_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

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
        //loading
        if(state is GetTopIndustriesState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is GetTopIndustriesState && state.dataState == DataState.success){
          Navigator.pop(context);
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
                  onClick: () => context.router.push(const AllServicesRoute()),
                ),
                10.height,
                AppExplorationTile(
                  title: getLocalization().myJobListings,
                  count: 0,
                  icon: const Icon(Iconsax.document_text_14),
                  onClick: ()=>context.router.push(const MyJobListingsRoute()),
                ),
                40.height,
                Row(
                  children: [
                    Expanded(child: Text(
                      getLocalization().services,
                      style: theme.textTheme.titleMedium,
                    )),
                    TextButton(
                        onPressed: () => context.router.push(const AllServicesRoute()),
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
                                title: industries!.industries[0].industry,
                                color: const Color(0xFFF17E2C),
                                icon: const Icon(Iconsax.setting,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              onClick:() => context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: industries.industries[0].id)),
                            ),
                            10.height,
                            AppSectionCard(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries.industries[1].industry,
                              color: const Color(0xFF23A8B3),
                              onClick:() => context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: industries.industries[1].id)),
                            ),
                          ]),
                    ),
                    10.width,
                    Expanded(
                      child: Column(
                          children: [
                            AppSectionCard(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries.industries[2].industry,
                              color: const Color(0xFF3EB62B),
                              onClick:() => context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: industries.industries[2].id)),
                            ),
                            10.height,
                            AppSectionCard.small(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries.industries[3].industry,
                              color: const Color(0xFFF44F4E),
                              onClick:() => context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: industries.industries[3].id)),
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
                        onPressed: () => context.router.push(const AllServicesRoute()),
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
                  height: 450,
                  child: (state.paginatedCandidates!=null)? ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index){
                      CandidateProfileEntity candidate = state.paginatedCandidates!.candidates[index];
                      return AppCandidateProfile(
                        fullName: candidate.fullName,
                        jobTitle: candidate.jobTitle,
                        rating: candidate.rating,
                        hourlyRate: "R${candidate.hourlyRate}p/h",
                        image: (candidate.profilePicture!=null)?
                        CachedNetworkImageProvider(
                            candidate.profilePicture!
                        ):null,
                        viewProfileFunction: (){
                          debugPrint("view profile clicked");
                        },
                      );
                    },
                  ):SizedBox(),
                ),

                PrimaryButton(onPressed:
                    ()=>context.router.push(const PendingProfileRoute()),
                    child: const Text("Pending profile"),
                )
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
      leading: const Icon(Iconsax.setting),
      title: Text(getLocalization().services,),
      actions: [
        TextButton(onPressed: (){}, child: Icon(Iconsax.menu_1, color: Theme.of(context).colorScheme.secondary,))
      ],
    );
  }

}