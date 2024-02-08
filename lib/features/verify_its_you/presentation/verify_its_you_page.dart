
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/verify_its_you_bloc.dart';

@RoutePage()
class VerifyItsYouPage extends BasePage {
   VerifyItsYouPage({super.key});
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  _VerifyItsYouPageState createState() => _VerifyItsYouPageState();
}

class _VerifyItsYouPageState extends BasePageState<VerifyItsYouPage, VerifyItsYouBloc> {

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

    var theme = Theme.of(context);
    return BlocConsumer<VerifyItsYouBloc, VerifyItsYouPageState>(
      listener: (context, state){},
      builder: (context, state) {
        return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children:[
            Positioned(
                top: 0,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.sizeOf(context).height * (1.5/3) ,
                  width: MediaQuery.sizeOf(context).width,
                  child:  Stack(
                      children:[
                        Positioned(
                          top: 0,
                          right:  -30,
                          child: Container(
                            child: SvgPicture.asset("assets/bottom_welcome_pebble.svg"),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left:  29.78,
                          child: Container(
                            child: SvgPicture.asset("assets/top_welcome_pebble.svg"),
                          ),
                        ),
                        Positioned(
                          top: -15,
                          right:  0,
                          child: Container(
                            child: SvgPicture.asset("assets/hi_there_man.svg"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: InkWell(onTap: ()=> context.router.pop()
                                    ,child: Icon(Icons.arrow_back)),),
                              Padding(
                                padding: EdgeInsets.only(top: 25, right: 32, bottom: 8),
                                child: wText(getLocalization().verifyItsYou,style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                              ),
                              Padding(
                                padding: EdgeInsets.only( right: 32, bottom: 8),
                                child: wText(getLocalization().letsGetYourAccountVerified,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                              ),

                            ],
                          ),
                        ),]
                  ),)
            ),
            Positioned(bottom: 0,
              child: Column(
                children: [

                  Container(height: MediaQuery.sizeOf(context).height * (2/3) ,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(32), topLeft: Radius.circular(32) ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top:30.0, bottom: 20, left: 20, right: 20),
                          child: wText(getLocalization().weveSentAnEmailPleaseClickOnTheVerificationLink,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                        Padding(padding: const EdgeInsets.only(top: 10, bottom: 14, left: 20, right: 20),
                          child: InkWell(
                            onTap: (){
                              sendCode();
                              // context.router.push( v());
                            } ,
                            child: wText(getLocalization().iDidntReceiveALink, style:
                            const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          ),),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                          child: PrimaryButton(
                            width: MediaQuery.sizeOf(context).width,
                            style: ButtonStyle(
                                side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                  return BorderSide(
                                    color: theme.primaryColor,
                                    width: 2,
                                  );
                                }
                                ),
                                backgroundColor: MaterialStateProperty.resolveWith(
                                        (Set<MaterialState> states){
                                      return theme.primaryColor;
                                    }
                                )
                            ),

                            onPressed:(){ context.router.pushAndPopUntil( LoginRoute(), predicate: (Route<dynamic> route) => false);
                            },
                            child: Text(getLocalization().loginIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
        );
      },
    );
  }




  @override
  VerifyItsYouBloc initBloc() {
    return locator<VerifyItsYouBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  Future<void> sendCode()async {
    await widget.firebaseAuth.currentUser!.sendEmailVerification();
  }


}
