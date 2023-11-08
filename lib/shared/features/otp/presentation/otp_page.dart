
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/otp_bloc.dart';

@RoutePage()
class otpPage extends BasePage {

  UserModel? userModel;
   otpPage({super.key, this.userModel});

  @override
  _otpPageState createState() => _otpPageState();
}

class _otpPageState extends BasePageState<otpPage, otpBloc> {

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
                     color: Colors.grey,
                     height: MediaQuery.sizeOf(context).height * (1/3) ,
                     width: MediaQuery.sizeOf(context).width,
                     child: const Padding(
                       padding: EdgeInsets.all(20.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             width: 25,
                             height: 25,
                             child: Icon(Icons.arrow_back),),
                           Padding(padding: EdgeInsets.only(top: 56,left: 32, right: 32, bottom: 8),)
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
                   child: OTPInput(
                     onSubmitted: (int pin){

                   },),
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
