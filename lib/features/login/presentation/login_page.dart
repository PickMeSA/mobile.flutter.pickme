import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:pickme/shared/features/otp/presentation/otp_page.dart';
import 'package:pickme/shared/widgets/w_text.dart';

@RoutePage()
class LoginPage extends BasePage {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {

  TextEditingController mobileNumberTextEditingController = TextEditingController();
  @override
  Widget buildView(BuildContext context) {
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
                 color: Colors.grey,
                 height: MediaQuery.sizeOf(context).height * (1/3) ,
                 width: MediaQuery.sizeOf(context).width,
                 child:  Padding(
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
                         child: wText(getLocalization().logIntoYourAccountWithYourPhoneNumberAndOtp,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                       )
                     ],
                   ),
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
                 padding: const EdgeInsets.all(30.0),
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 20, bottom:  10),
                       child: AppTextFormField(

                         controller: mobileNumberTextEditingController,
                         // validator: (value)=> validatePhoneNumber(value??""),
                         prefixIcon: SizedBox(width: 50,
                           child: Row(
                             children: [Text("+27",)],
                           ),
                         ),
                         padding: const EdgeInsets.only(left: 20, right: 20),
                         textFieldType: TextFieldType.NUMBER, labelText: getLocalization().phoneNumber,),
                     ),
                     const Spacer(),
                     PrimaryButton(width: MediaQuery.sizeOf(context).width - 45,
                         onPressed: () async {
                           getBloc().add(LoginContinueClickedEvent(mobileNumber: mobileNumberTextEditingController.text));
                         },
                         child: Text(getLocalization().ccontinue)),
                     Padding(padding: const EdgeInsets.only(top: 24, bottom: 14),
                       child: Center(
                           child: InkWell(
                             onTap: (){
                              context.router.push(const RegisterRoute());
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
       if(state is LoginContinueClickedState && state.dataState == DataState.loading){
         context.router.push(OtpRoute(
             userModel: UserModel(mobile:mobileNumberTextEditingController.text , email: '', surname: '', firstName: '')));
       }
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
