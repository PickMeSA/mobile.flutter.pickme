
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/application_sent/presentation/bloc/application_sent_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_text.dart';

@RoutePage()
class ApplicationSentPage extends BasePage {
  const ApplicationSentPage({super.key});

  @override
  _ApplicationSentPageState createState() => _ApplicationSentPageState();
}

class _ApplicationSentPageState extends BasePageState<ApplicationSentPage, ApplicationSentBloc> {

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
    return BlocConsumer<ApplicationSentBloc, ApplicationSentPageState>(
      listener: (context, state){},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                wText(getLocalization().applicationSent,style:theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Colors.black
                )),
                20.height,
                wText(getLocalization().applicationSenttext),
                20.height,
                SizedBox(
                  height: 400,
                  child: Image.asset("assets/man_and_woman_celebration.png"),
                ),
                Spacer(),
                SecondaryButtonDark(fullWidth: true,onPressed: (){
                //  context.router.pushAndPopUntil(BottomNavigationBarRoute(profileEntity: state),
                  //    predicate: (Route<dynamic> route) => false);
                }, child: wText(getLocalization().backToJobs))
              ],
            ),
          )  ,
        );
      },
    );
  }


  @override
  ApplicationSentBloc initBloc() {
    return locator<ApplicationSentBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
