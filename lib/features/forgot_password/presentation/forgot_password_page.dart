
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/lets_begin/presentation/modal/validation.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/forgot_password_bloc.dart';

@RoutePage()
class ForgotPasswordPage extends BasePage {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BasePageState<ForgotPasswordPage, ForgotPasswordBloc> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController emailAddressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  final _formKey = GlobalKey<FormState>();


    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordPageState>(
      listener: (context, state){
        if(state.dataState == DataState.loading){
          preloader(context);
        }

        if(state.dataState == DataState.success && state is ResetEmailButtonClickedState){
          context.router.pop();
          wErrorPopUp(message: getLocalization().anEmailContainingALinkToResetYourPasswordHasBeenSentToYourEmailAddress, type: getLocalization().information, context: context);

        }
      },
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                height: 250,
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
                                        child: wText(getLocalization().forgotPassword,style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only( right: 32, bottom: 8),
                                        child: wText(getLocalization().letsGetYouUpAndRunningAgain,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                                      )
                                    ],
                                  ),
                                ),]
                          ),)
                    ),
                  ],
                ),
              ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(32), topLeft: Radius.circular(32) ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom:  10),
                            child: AppTextFormField(
                              onChanged: (value)=> getBloc().add(EmailChangedEvent(emailAddress: value)),
                              controller: emailAddressController,
                              validator: (value)=> validateEmailAddress(value??""),
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              textFieldType: TextFieldType.EMAIL, labelText: getLocalization().emailAddress,),
                          ),
                          Padding(
                            padding: EdgeInsets.only( right: 32, bottom: 8),
                            child: wText(getLocalization().enterYourEmailAddressToReceiveAnEmailWithALinkToResetYourPassword,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                          ),
                          PrimaryButton(
                            width: MediaQuery.sizeOf(context).width,
                            style: ButtonStyle(
                                side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                  return BorderSide(
                                    color: states.contains(MaterialState.disabled)?
                                    theme.colorScheme.secondary.withOpacity(0):
                                    theme.colorScheme.secondary,
                                    width: 2,
                                  );
                                }
                                ),
                                backgroundColor: MaterialStateProperty.resolveWith(
                                        (Set<MaterialState> states){
                                      return states.contains(MaterialState.disabled)?
                                      theme.colorScheme.secondary.withOpacity(0.3):
                                      theme.colorScheme.secondary;
                                    }
                                )
                            ),
                            onPressed: !getBloc().checked?null:()async {
                              if(_formKey.currentState!.validate())
                                resendEmailLink(
                                    email: emailAddressController.text);

                            },
                            child: Text(getLocalization().resetPassword),
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ]
            ),
          ),
        );
      },
    );
  }


  @override
  ForgotPasswordBloc initBloc() {
    return locator<ForgotPasswordBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  void resendEmailLink({required String email})async {
      try {
        getBloc().add(ResetEmailButtonClickedEvent(index: 0));
        await firebaseAuth.sendPasswordResetEmail(email: email);
        Navigator.pop(context);
        getBloc().add(ResetEmailButtonClickedEvent(index: 1));

      } on FirebaseAuthException catch(err){
        getBloc().add(ResetEmailButtonClickedEvent(index: 2));
        wErrorPopUp(message: err.message.toString(), type: getLocalization().error, context: context);
      }catch(ex){
        getBloc().add(ResetEmailButtonClickedEvent(index: 2));
        wErrorPopUp(message: ex.toString(), type: getLocalization().error, context: context);
      }

  }


}
