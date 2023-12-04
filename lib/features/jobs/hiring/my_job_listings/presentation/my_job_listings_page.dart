import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';

import 'bloc/my_job_listings_bloc.dart';

@RoutePage()
class MyJobListingsPage extends BasePage {
  const MyJobListingsPage({super.key});


  @override
  State<MyJobListingsPage> createState() => _MyJobListingsPageState();
}

class _MyJobListingsPageState extends BasePageState<MyJobListingsPage, MyJobListingsBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(MyJobListingsPageEnteredEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<MyJobListingsBloc, MyJobListingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        PaginatedIndustryEntity? industries = state.paginatedIndustries;
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: Column(
            children: [
              AppExplorationTile(
                icon: const Icon(Iconsax.add),
                showNextIcon: false,
                title: getLocalization().createANewJobListing,
                onClick: () => context.router.push(const CreateJobListingRoute()),
              ),
              24.height,
              Expanded(
                child: AppTabBar(
                  initialIndex: state.selectedTabIndex,
                  tabs: [
                    Text(getLocalization().activeListings),
                    Text(getLocalization().inactiveListings),
                  ],
                  views: [
                    Column(
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
                        Text(getLocalization().youDontHaveAnyActiveListings,
                          style: theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 160,
                          width: 160,
                          child: Image(
                            image: AssetImage("assets/no_items_found.png"),
                          ),
                        ),
                        24.height,
                        Text(getLocalization().youDontHaveAnyInactiveListings,
                          style: theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ], onTap: (int index) => getBloc().add(SelectedTabChangedEvent(tabIndex: index)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  MyJobListingsBloc initBloc() {
    return locator<MyJobListingsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().myJobListings,),
    );
  }

}