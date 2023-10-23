import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

import 'bloc/landing_bloc.dart';

@RoutePage()
class LandingPage extends BasePage {
  const LandingPage({super.key});


  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends BasePageState<LandingPage, LandingBloc> {
  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<LandingBloc, LandingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,top: 10.0, bottom: 10),
                child: Text(
                    getLocalization().welcomeTopickme,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    )
                ),
              ),
              Positioned(
                top: 120,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,top: 10.0, bottom: 10),
                  child: Text(
                      getLocalization().connectingWorkersAndClients,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                ),
              ),
                 Positioned(
                   top: 190,
                   child: Container(
                     child: SvgPicture.asset("assets/landing_screen_lady.svg"),
                   ),
                 ),
              Positioned(
                top: 50,
                right: 0,
                child: Container(
                  child: SvgPicture.asset("assets/landing_screen_man.svg"),
                ),
              ),


              Positioned(
                bottom: 80,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,top: 10, bottom: 10),
                  child: PrimaryButton(width: MediaQuery.sizeOf(context).width - 45,onPressed: () async {
                    context.router.push(LoginRoute());
                  },
                      child: Text(getLocalization().loginIn)),
                ),
              ),

              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,top: 10, bottom: 10),
                  child: SecondaryButton(width: MediaQuery.sizeOf(context).width - 45 ,onPressed: () async {
                    context.router.push(const RegisterRoute());
                  }, child: Text(getLocalization().newHereCreateAccount)),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  LandingBloc initBloc() {
    return locator<LandingBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}