import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/hiring/landing_page/presentation/bloc/jobs_hiring_landing_page_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';

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
        // TODO: implement listener
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
                  onClick: (){},
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
                            AppSectionCard.small(title: industries!.industries[0].industry,
                                color: const Color(0xFFF17E2C),
                                icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,)
                            ),
                            10.height,
                            AppSectionCard(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries.industries[1].industry,
                              color: const Color(0xFF23A8B3),
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
                            ),                        10.height,
                            AppSectionCard.small(
                              icon: const Icon(Iconsax.setting, color: Colors.white, size: 20,),
                              title: industries.industries[3].industry,
                              color: const Color(0xFFF44F4E),
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
                //Todo: Substitute with list view
                const AppCandidateProfile(fullName: "full Name", jobTitle: "jobTitle", rating: 3, hourlyRate: "R20.00p/h"),

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