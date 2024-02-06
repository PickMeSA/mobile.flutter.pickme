
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/lets_begin/domain/entites/lets_begin_entity.dart';
import 'package:pickme/features/lets_begin/presentation/modal/validation.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:iconsax/iconsax.dart';
import 'bloc/lets_begin_bloc.dart';

@RoutePage()
class LetsBeginPage extends BasePage {
  const LetsBeginPage({super.key});

  @override
  _LetsBeginPageState createState() => _LetsBeginPageState();
}

class _LetsBeginPageState extends BasePageState<LetsBeginPage, LetsBeginBloc> {

  late TextEditingController confirmPasswordController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  late TextEditingController emailAddressController = TextEditingController();



  String? verificationId;
  int? resentToken;

  final _formKey = GlobalKey<FormState>();

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
    return BlocConsumer<LetsBeginBloc, LetsBeginPageState>(
      listener: (context, state){},
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Form(
            key: _formKey,
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
                                    child: wText(getLocalization().hiThere,style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
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
                Positioned(bottom: 0,
                  child: Container(height: MediaQuery.sizeOf(context).height * (2/3) ,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(32), topLeft: Radius.circular(32) ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:30.0, bottom: 20, left: 20, right: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only( top: 10, bottom:  10),
                              child: AppTextFormField(
                                onChanged: (value)=> getBloc().add(ValueChangedEvent(letsBeginEntity: getLetsBeginEntity())),
                                validator: (value)=> validateEmailAddress(value??""),
                                controller: emailAddressController,
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                textFieldType: TextFieldType.EMAIL, labelText: getLocalization().emailAddress,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only( top: 10, bottom:  10),
                              child: AppTextFormField(
                                onChanged: (value)=> getBloc().add(ValueChangedEvent(letsBeginEntity: getLetsBeginEntity())),
                                validator: (value)=> validatePassword(value??""),
                                controller: passwordController,
                                padding: const EdgeInsets.only(left: 20, right: 20,),
                                textFieldType: TextFieldType.PASSWORD, labelText: getLocalization().passwordA,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom:  10),
                              child: AppTextFormField(
                                onChanged: (value)=> getBloc().add(ValueChangedEvent(letsBeginEntity: getLetsBeginEntity())),
                                validator: (value)=> validateConfirmPassword(value??"",passwordController.text??""),
                                controller: confirmPasswordController,
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                textFieldType: TextFieldType.PASSWORD, labelText: getLocalization().confirmPasswordA,),
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

                                onPressed: !getBloc().checked!?null:() {
                                  if(_formKey.currentState!.validate()) {
                                    /*  */ authenticate(getLetsBeginEntity());
                                  }
                                },
                                child: Text(getLocalization().ccontinue),
                              ),
                            ),
                          ],

                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  LetsBeginBloc initBloc() {
    return locator<LetsBeginBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


  LetsBeginEntity getLetsBeginEntity(){
    return LetsBeginEntity(email: emailAddressController.text??"",
        confirmPassword: confirmPasswordController.text??"",
        password: passwordController.text??"");
  }
  
  void authenticate (LetsBeginEntity letsBeginEntity) async{
    try{
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: letsBeginEntity.email, password: letsBeginEntity.password);

      User? user =  FirebaseAuth.instance.currentUser;

      if(user!= null && !user.emailVerified){
        await user.sendEmailVerification();
      }

      context.router.pushAndPopUntil( VerifyItsYouRoute(), predicate: (Route<dynamic> route) => false);


    }on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        wErrorPopUp(message: getLocalization().thePasswordProvidedIsTooWeak, type: getLocalization().information, context: context);
      }else if(e.code == 'email-already-in-use'){
        wErrorPopUp(message: getLocalization().theAccountAlreadyExistsForThatEmail, type: getLocalization().information, context: context);
      }
    }
  }


}
