import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/features/register/presentation/bloc/register__bloc.dart';
import 'package:pickme/features/register/presentation/mixins/validation_mixin.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';


@RoutePage()
class RegisterPage extends BasePage {
    String email;
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   RegisterPage({required this.email,super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BasePageState<RegisterPage,RegisterBloc> {

  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController surnameController = TextEditingController();
  late TextEditingController phoneNumberController = TextEditingController();
  late TextEditingController idNumberController = TextEditingController();
  late TextEditingController passportNumberController = TextEditingController();
  late TextEditingController emailAddressController = TextEditingController();
  late TextEditingController workPermitController = TextEditingController();


  String? verificationId;
  int? resentToken;


  final _formKey = GlobalKey<FormState>();
  EdgeInsets _viewInsets = EdgeInsets.zero;
  SingletonFlutterWindow? window;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailAddressController.text = widget.email;
    window = WidgetsBinding.instance?.window;
    window?.onMetricsChanged = () {
      setState(() {
        final window = this.window;
        if (window != null) {
          _viewInsets = EdgeInsets.fromWindowPadding(
            window.viewInsets,
            window.devicePixelRatio,
          ).add(EdgeInsets.fromWindowPadding(
            window.padding,
            window.devicePixelRatio,
          )) as EdgeInsets;
        }
      });
    };
  }

  @override
  Widget buildView(BuildContext context) {

    var theme = Theme.of(context);
    return BlocConsumer<RegisterBloc, RegisterState>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: MediaQuery.sizeOf(context).width,
      height:  double.infinity,
      child: Padding(
        padding:  EdgeInsets.only(bottom: _viewInsets.bottom ),
        child: Form(
            key: _formKey,
          child: ListView(
            children:[ Column(
              children: [
                SizedBox(
                  height: 250,
                  child: Stack(
                    children:[
                      Positioned(
                          top: 0,
                          child: Container(
                            color: Colors.white,
                            height: 280 ,
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
                                          child: wText(getLocalization().letsOnboardYou,style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only( right: 32, bottom: 8),
                                          child: wText(getLocalization().letsGetYouStartedByCreatingYourAccount,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
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
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(32), topLeft: Radius.circular(32) ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top:30.0, bottom: 20, left: 20, right: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only( top: 10, bottom:  10),
                          child: AppTextFormField(
                            onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                            validator: (value)=> validateName(value??""),
                            controller: firstNameController,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            textFieldType: TextFieldType.NAME, labelText: getLocalization().fullName,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( top: 10, bottom:  10),
                          child: AppTextFormField(
                            onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                            validator: (value)=> validateSurname(value??""),
                            controller: surnameController,
                            padding: const EdgeInsets.only(left: 20, right: 20,),
                            textFieldType: TextFieldType.NAME, labelText: getLocalization().surname,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom:  10),
                          child: AppTextFormField(
                            onChanged: (value){ getBloc().add(ValueChangedEvent(userModel: getGetUserModel()));
                            if(value.length == 9 ) {
                              FocusScope.of(context).unfocus();
                            }},
                            validator: (value)=> validatePhoneNumber(value??""),
                            prefixIcon: SizedBox(width: 50,
                              child: Row(
                                children: [Text(getLocalization().phonePrefix,)],
                              ),
                            ),
                            controller: phoneNumberController,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            textFieldType: TextFieldType.NUMBER, labelText: getLocalization().phoneNumber,),
                        ),
                  Row(
                    children: [
                      Expanded(
                        child: wText(
                          getLocalization().whyWeNeedYourId,
                          style: theme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      TertiaryButton(onPressed: (){
                        context.router.push(const IdReasonRoute());
                      },
                          child: Icon(Icons.info_outline, color: theme.colorScheme.secondary,)
                      )
                    ],),
                        AppTabBar(
                          onTap: (index)=> getBloc().add(IdentificationChangedEvent(index: index)),
                          viewHeight: getBloc().index == 0?100: 180,
                          initialIndex: 0,
                          tabs:  <Widget>[
                            InkWell(
                                child: Text(getLocalization().idNumber)),
                            Text(getLocalization().passport),
                          ],
                          views:  <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:  const EdgeInsets.only( top: 10, bottom:  10),
                                  child: AppTextFormField(
                                    onChanged: (value){ getBloc().add(ValueChangedEvent(userModel: getGetUserModel()));
                                    if(value.length == 13) {
                                      FocusScope.of(context).unfocus();
                                    }
                                    },
                                    validator: (value){},
                                    controller: idNumberController,
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  5),
                                    textFieldType: TextFieldType.NUMBER, labelText: getLocalization().idNumber,),
                                ),
                                Text(getLocalization().indicatesARequiredField),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only( top: 10, bottom:  10),
                                  child: AppTextFormField(
                                    onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                                    validator: (value) {

                                    },
                                    controller: passportNumberController,
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  5),
                                    textFieldType: TextFieldType.NUMBER, labelText: getLocalization().passportNumberA,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only( top: 10, bottom:  5),
                                  child: AppTextFormField(

                                    onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                                    controller: workPermitController,
                                    validator: (value){},
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10,  ),
                                    textFieldType: TextFieldType.NUMBER, labelText: getLocalization().workPermitNumber,),
                                ),
                                Text(getLocalization().indicatesARequiredField),
                              ],
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: PrimaryButton(
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

                            onPressed: !getBloc().checked! ? null :() {
                              if(_formKey.currentState!.validate()) {
                                authenticate(mobileNumber: "${getLocalization().phonePrefix}${phoneNumberController.text}");
                                /*  */
                              }
                            },
                            child: Text(getLocalization().ccontinue),
                          ),
                        ),
                      ],

                    ),
                  ),
                ),

              ],
            ),]
          ),
    ),
      ),
    );
  },
);
  }

  Future<void> authenticate({ required String mobileNumber})  async {
    dismissLoadingIndicator() {
      if(getBloc().preloader) {
        Navigator.pop(context);
        getBloc().preloader = false;
      }
    }

    if(!getBloc().preloader) {
      preloader(context);
      getBloc().preloader = true;
    }

    await widget.firebaseAuth.verifyPhoneNumber(
      phoneNumber: mobileNumber,
      timeout: const Duration(minutes: 1),
      verificationCompleted: (PhoneAuthCredential credential) async {

        await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
          await value.user!.getIdToken(true).then((value1) {

          });
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        dismissLoadingIndicator();
        wErrorPopUp(message: e.toString(), type: getLocalization().error, context: context);
      },
      codeSent: (String verificationId, int? resendToken) async {
         dismissLoadingIndicator();
         context.router.push(OTPRoute(
         verificationId: verificationId,
            userModel: getGetUserModel(),
            fromregister: true));

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  RegisterBloc initBloc() {
    return locator<RegisterBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

 UserEntity getGetUserModel(){
    return UserEntity(
        email: widget.email,
        surname: surnameController.text,
        firstName: firstNameController.text,
        mobile: "${getLocalization().phonePrefix}${phoneNumberController.text}",
        workPermitNumber: workPermitController.text,
        passportNumber: passportNumberController.text,
        idNumber: idNumberController.text,
    );
  }


}
