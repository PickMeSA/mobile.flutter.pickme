import 'package:flutter/gestures.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/domain/entities/subscription_plan_entity.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/presentation/bloc/jobs_landing_page_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';

@RoutePage()
class JobsLandingPage extends BasePage {
  const JobsLandingPage({super.key});


  @override
  State<JobsLandingPage> createState() => _JobsLandingPageState();
}

class _JobsLandingPageState extends BasePageState<JobsLandingPage, JobsLandingPageBloc> {
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<JobsLandingPageBloc, JobsLandingPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppExplorationTile(
                  title: getLocalization().exploreAllJobs,
                  onClick: (){},
                ),
                10.height,
                AppExplorationTile(
                  title: getLocalization().myJobRequests,
                  count: 0,
                  icon: const Icon(Iconsax.document_text_14),
                  onClick: (){},
                ),
                10.height,
                AppExplorationTile(
                  title: getLocalization().mySavedJobs,
                  count: 0,
                  icon: const Icon(Iconsax.archive_tick),
                  onClick: (){},
                ),
                40.height,
                Row(
                  children: [
                    Expanded(child: Text(
                      getLocalization().recommendedForYou,
                      style: theme.textTheme.titleMedium,
                    )),
                    TextButton(
                        onPressed: ()=> getBloc().add(SeeAllClickedEvent()),
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
                Column(
                  children: [
                    AppJobAdvertCard.matching(
                      jobName: "Job Name",
                      employerName: "Employer Name",
                      locationName: "location Name",
                      dateTime: DateTime.now(),
                      onNext: (){}
                      ,)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  JobsLandingPageBloc initBloc() {
    return locator<JobsLandingPageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}