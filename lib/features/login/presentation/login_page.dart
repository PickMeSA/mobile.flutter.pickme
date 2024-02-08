import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/lets_begin/presentation/modal/validation.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/features/login/presentation/bloc/login_bloc.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

@RoutePage()
class LoginPage extends BasePage {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {

  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
   return BlocConsumer<LoginBloc,LoginState>
     (builder: (context , state){
     return SingleChildScrollView(
       child: SizedBox(
         width: MediaQuery.sizeOf(context).width,
         height: MediaQuery.sizeOf(context).height,
         child: ListView(
           children: [
             SizedBox(height: 250,
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
                           top: 12,
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
                               top: 12,
                               right:  0,
                               child: Container(
                                 child: SvgPicture.asset("assets/welcome_back_lady.svg"),
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
                                   child: wText(getLocalization().welcomeBack,style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                                 ),
                                 Padding(
                                   padding: EdgeInsets.only( right: 32, bottom: 8),
                                   child: wText(getLocalization().logIntoYourAccountWithYourEmailAndPassword,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                                 )
                               ],
                             ),
                           ),]
                         ),)
                   ),
                 ],
               ),
             ),
             Form(
               key: _formKey,
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 20, bottom:  10),
                       child: AppTextFormField(

                         onChanged: (value)=> getBloc().add(NumberChangedEvent(email: value, password: passwordController.text)),
                         controller: emailAddressController,
                         validator:(value){
                           if(value.isEmptyOrNull)
                             return getLocalization().pleaseEnterAUsername;
                         },
                         padding: const EdgeInsets.only(left: 20, right: 20),
                         textFieldType: TextFieldType.EMAIL, labelText: getLocalization().emailAddress,),
                     ),
                     Padding(
                       padding: const EdgeInsets.only( bottom:  10),
                       child: AppTextFormField(

                         onChanged: (value)=> getBloc().add(NumberChangedEvent(email: emailAddressController.text , password:value )),
                         controller: passwordController,
                         validator: (value){
                           if(value.isEmptyOrNull)
                             return getLocalization().pleaseEnterAPassword;
                         },

                         padding: const EdgeInsets.only(left: 20, right: 20),
                         textFieldType: TextFieldType.PASSWORD, labelText: getLocalization().passwordA,),

                     ),
                     Padding(padding: const EdgeInsets.only(top: 10, bottom: 14),
                       child: InkWell(
                         onTap: (){
                           context.router.push( ForgotPasswordRoute());
                         } ,
                         child: wText(getLocalization().forgotPassword, style:
                         const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                       ),),

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
                         if(_formKey.currentState!.validate()){
                           authenticate(username: emailAddressController.text, password: passwordController.text);
                         }
                       },
                       child: Text(getLocalization().ccontinue),
                     ),
                     Padding(padding: const EdgeInsets.only(top: 24, bottom: 14),
                       child: Center(
                           child: InkWell(
                             onTap: (){
                               context.router.push( const LetsBeginRoute());
                             } ,
                             child: wText(getLocalization().noAccountCreateOne, style:
                             const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                           )
                       ),)
                   ],
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   },
       listener: (context , state){
      if(state is LoginContinueClickedState && state.dataState == DataState.loading){
        preloader(context);
      }
      if(state is LoginContinueClickedState && state.dataState == DataState.success){
        Navigator.pop(context);
        if(state.profileEntity?.firstName == null){
          context.router.push( RegisterRoute(email:emailAddressController.text ));
        }else if(state.profileEntity!.type!.isEmpty){
          context.router.push(const SetupProfileRoute());
        }else if (state.profileEntity!.acceptedTermsAndConditions == false){
          context.router.push(const RegisterAccountStep1Route());
        }else if (state.profileEntity!.qualifications!.isEmpty &&
            state.profileEntity!.workExperience!.isEmpty){
          context.router.push(const QualificationsRoute());
        }else if(state.profileEntity!.skills!.isEmpty){
          context.router.push(const AddSkillsRoute());
        }else if(state.profileEntity!.hourlyRate! == 0){
          context.router.push(const RateAndWorkTimesRoute());
        }else if(state.profileEntity!.paymentDetails!.bankName!.isEmpty){
          context.router.push(const BankDetailsRoute());
        }else if(state.profileEntity!.location!.address == "" ){
          context.router.push(const LocationRoute(),);
        }else if(state.profileEntity!.description!.isEmpty) {
          context.router.push(const FinalDetailsRoute());
        }else if(!state.profileEntity!.subscriptionPaid!){
          context.router.push( PaySomeoneWebViewRoute(from: 0));}
        else{
          context.router.pushAndPopUntil( BottomNavigationBarRoute(profileEntity: state.profileEntity), predicate: (Route<dynamic> route) => false);
        }
      }

      if(state is LoginContinueClickedState && state.dataState == DataState.error){
        Navigator.pop(context);
        wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
      }
   });
  }

  Future<void> authenticate({ required String username, required String password})  async {
    preloader(context);
    await widget.firebaseAuth.signInWithEmailAndPassword(
        email: username,
        password: password).then((value)async{

          if(value.user!.emailVerified){
            String? token = await value.user?.getIdToken();
            TokenModel tokenModel =
            TokenModel(
                refreshToken: token??"",
                accessToken: token??"",
                tokenID: token??"");
            boxTokens.put(current, tokenModel);
            UserModel userModel = UserModel(id: "");
            userModel.id = value.user?.uid;
            boxUser.put(current, userModel);
            Navigator.pop(context);
            getBloc().add(LoginContinueClickedEvent());
          }else{
            //context.router.pop();
            Navigator.pop(context);
            context.router.push(VerifyItsYouRoute());
          }

    }).catchError((error, stackTrace){
      Navigator.pop(context);
      wErrorPopUp(message: error.toString(), type: getLocalization().error, context: context);
    });
  }

  @override
  LoginBloc initBloc() {
    return locator<LoginBloc>();
  }

  @override
  AppLocalizations initLocalization() {
   return locator<AppLocalizations>();
  }

}
