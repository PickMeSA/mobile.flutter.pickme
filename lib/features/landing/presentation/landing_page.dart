import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

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

        var theme = Theme.of(context);
        return GestureDetector(
          onDoubleTap: ()=> showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return SafeArea(
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.developer_mode),
                          title: const Text('Development'),
                          onTap: () async {
                            var pref = await SecureSharedPref.getInstance();
                            String? baseUrl = await pref.getString("dev_base_url", isEncrypted: true);
                            String? apiVersion = await pref.getString("dev_api_version", isEncrypted: true);
                            pref.putString("base_url", baseUrl??'', isEncrypted : true);
                            pref.putString("api_version", apiVersion??'', isEncrypted : true);
                            Navigator.of(context).pop();
                            },
                        ),
                        ListTile(
                          leading: const Icon(Icons.storage),
                          title: const Text('Production'),
                          onTap: ()async{
                            var pref = await SecureSharedPref.getInstance();
                            String? baseUrl = await pref.getString("prod_base_url", isEncrypted: true);
                            String? apiVersion = await pref.getString("prod_api_version", isEncrypted: true);
                            pref.putString("base_url", baseUrl??'', isEncrypted : true);
                            pref.putString("api_version", apiVersion??'', isEncrypted : true);
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.cancel),
                          title: const Text('Cancel'),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
          child: Container(
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
                  top: 140,
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
                        child: wText(getLocalization().loginIn)),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20,left: 20,top: 10, bottom: 10),
                    child: SecondaryButtonDark(width: MediaQuery.sizeOf(context).width - 45 ,onPressed: () async {
                       context.router.push( LetsBeginRoute());
                      // ToDo: Change back to above
                      //context.router.push(const RegisterAccountStep1Route());
                    }, child: wText(getLocalization().newHereCreateAccount),color: theme.colorScheme.secondary),
                  ),
                )
              ],
            ),
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