
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/you_are_all_setup_bloc.dart';

@RoutePage()
class YouAreAllSetupPage extends BasePage {
  ProfileEntity? profileEntity;
   YouAreAllSetupPage({ this.profileEntity,super.key});

  @override
  _YouAreAllSetupPageState createState() => _YouAreAllSetupPageState();
}

class _YouAreAllSetupPageState extends BasePageState<YouAreAllSetupPage, YouAreAllSetupBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<YouAreAllSetupBloc, YouAreAllSetupPageState>(
      listener: (context, state){},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  wText(getLocalization().youAreAllSetup,style:theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: Colors.black
                  )),
                  20.height,
                  wText(getLocalization().weAreSuperExcitedToHaveYouJoinThePickMeCommunity),
                  20.height,
                  SizedBox(
                    height: 400,
                   child: Image.asset("assets/man_woman_with_phones.png"),
                  ),
                  40.height,
                  PrimaryButton(fullWidth: true,onPressed: (){
                    context.router.pushAndPopUntil(BottomNavigationBarRoute(),
                    predicate: (Route<dynamic> route) => false);
                  }, child: wText(getLocalization().goToDashboard))
                ],
              ),
            ),
          )  ,
        );
      },
    );
  }


  @override
  YouAreAllSetupBloc initBloc() {
    return locator<YouAreAllSetupBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
