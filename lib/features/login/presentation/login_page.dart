import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/login/presentation/bloc/login_bloc.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:pickme/navigation/app_route.dart';
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
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
   return BlocConsumer<LoginBloc,LoginState>
     (builder: (context , state){
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


           Positioned(bottom: 0,
             child: Container(height: MediaQuery.sizeOf(context).height * (1.9/3) ,
               width: MediaQuery.sizeOf(context).width,
               decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(topRight: Radius.circular(32), topLeft: Radius.circular(32) ),
               ),
               child: Padding(
                 padding: const EdgeInsets.all(30.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 20, bottom:  10),
                       child: AppTextFormField(

                          onChanged: (value)=> getBloc().add(NumberChangedEvent(mobileNumber: value)),
                         controller: emailAddressController,
                         // validator: (value)=> validatePhoneNumber(value??""),
                         prefixIcon: SizedBox(width: 50,
                           child: Row(
                             children: [Text(getLocalization().countryCode,)],
                           ),
                         ),
                         padding: const EdgeInsets.only(left: 20, right: 20),
                         textFieldType: TextFieldType.EMAIL, labelText: getLocalization().emailAddress,),
                     ),
                     Padding(
                       padding: const EdgeInsets.only( bottom:  10),
                       child: AppTextFormField(

                         onChanged: (value)=> getBloc().add(NumberChangedEvent(mobileNumber: value)),
                         controller: passwordController,
                         // validator: (value)=> validatePhoneNumber(value??""),
                         prefixIcon: SizedBox(width: 50,
                           child: Row(
                             children: [Text(getLocalization().countryCode,)],
                           ),
                         ),
                         padding: const EdgeInsets.only(left: 20, right: 20),
                         textFieldType: TextFieldType.PASSWORD, labelText: getLocalization().passwordA,),

                     ),
                     Padding(padding: const EdgeInsets.only(top: 10, bottom: 14),
                       child: InkWell(
                         onTap: (){
                           context.router.push( RegisterRoute());
                         } ,
                         child: wText(getLocalization().forgotPassword, style:
                         const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                       ),),
                     const Spacer(),
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
                       onPressed: !state.checked?null:()async {
                       },
                       child: Text(getLocalization().ccontinue),
                     ),
                     Padding(padding: const EdgeInsets.only(top: 24, bottom: 14),
                       child: Center(
                           child: InkWell(
                             onTap: (){
                              context.router.push( RegisterRoute());
                             } ,
                             child: wText(getLocalization().noAccountCreateOne, style:
                             const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                           )
                       ),)
                   ],
                 ),
               ),
             ),
           ),

         ],
       ),
     );
   },
       listener: (context , state){

   });
  }

  Future<void> authenticate({ required String mobileNumber})  async {
    if(!getBloc().preloader) {
      preloader(context);
      getBloc().preloader = true;
    }
    await widget.firebaseAuth.verifyPhoneNumber(
      phoneNumber: mobileNumber,
      timeout: const Duration(minutes: 1),
      verificationCompleted: (PhoneAuthCredential credential) async{
        await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
          await value.user!.getIdToken(true).then((value1) {

          });
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Navigator.pop(context);
        wErrorPopUp(message: e.toString(), type: getLocalization().error, context: context);
      },
      codeSent: (String verificationId, int? resendToken) async {
        if(getBloc().preloader) {
          Navigator.pop(context);
          getBloc().preloader = false;
        }
        final error =  await context.router.push(OTPRoute(
            verificationId: verificationId,
            userModel: UserEntity(
              email: "",
              surname: '',
              firstName: '',
              mobile: mobileNumber,
            ),
            fromregister: false));
        if(error != null){
          if(getBloc().preloader) {
            Navigator.pop(context);
            getBloc().preloader = false;
          }
          wErrorPopUp(message: error.toString(), type: getLocalization().error, context: context);
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
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
