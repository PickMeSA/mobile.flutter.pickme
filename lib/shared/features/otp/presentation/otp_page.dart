
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/otp_bloc.dart';

@RoutePage()
class OTPPage extends BasePage {

  UserModel? userModel;
   OTPPage({super.key, this.userModel});

  @override
  _otpPageState createState() => _otpPageState();
}

class _otpPageState extends BasePageState<OTPPage, otpBloc> {

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
    return BlocConsumer<otpBloc, otpPageState>(
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
                     color: Colors.white38,
                     height: MediaQuery.sizeOf(context).height * (1/3) ,
                     width: MediaQuery.sizeOf(context).width,
                     child:  Padding(
                       padding: EdgeInsets.all(20.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            SizedBox(
                             width: 25,
                             height: 25,
                             child: InkWell(onTap: ()=> context.router.pop(),
                                 child: Icon(Icons.arrow_back)),),
                           Padding(
                             padding: EdgeInsets.only(top: 25, right: 32, bottom: 8),
                           child: wText(getLocalization().enterYourOTP,style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                           ),
                           Padding(
                             padding: EdgeInsets.only( right: 32, bottom: 8),
                             child: wText(getLocalization().weveSentaOneTimePine(obscureNumber(widget.userModel!.mobile)),style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
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
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 50),
                           child: OTPInput(
                             onSubmitted: (int pin){

                           },),
                         ),
                         const Spacer(),
                         PrimaryButton(width: MediaQuery.sizeOf(context).width - 45,
                             onPressed: () async {
                             },
                             child: Text(getLocalization().submit)),
                         Padding(padding: EdgeInsets.only(top: 24, bottom: 14),
                         child: Center(
                          child: InkWell(
                            onTap: ()=> context.router.push(ResendOTPRoute(userModel: widget.userModel!)) ,
                            child: wText(getLocalization().iDidntReceiveACode, style:
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
    );
  }


  @override
  otpBloc initBloc() {
    return locator<otpBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
}
