
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/otp_bloc.dart';

@RoutePage()
class OTPPage extends BasePage {

  UserEntity? userModel;
  bool? fromregister;
   OTPPage({super.key, this.userModel, this.fromregister = false});

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

    var theme = Theme.of(context);
    return BlocConsumer<otpBloc, otpPageState>(
      listener: (context, state){

        //OTPGetTokenState////////////////////////////////////////////////////
        //success
        if(state is OTPGetTokenState && state.dataState == DataState.success){
          if(widget.fromregister!) {
            getBloc().add(SaveRemoteProfileDataEvent(userModel: widget.userModel!));
          }else{
            getBloc().add(GetProfileProgressEvent());
          }
        }

        //error
        if(state is OTPGetTokenState && state.dataState == DataState.error){
        // error dialog
          print(state.error);
        }
        //loading
        if(state is OTPGetTokenState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }

        //RegisterOTPCompleteState/////////////////////////////////////
        //Success
        if(state is RegisterOTPCompleteState && state.dataState == DataState.success){


         if(state.profileEntity!.type!.isEmpty){
            context.router.pushAndPopUntil(const SetupProfileRoute(),
                predicate: (Route<dynamic> route) => false);
          }else if (state.profileEntity!.qualifications!.isEmpty &&
              state.profileEntity!.workExperience!.isEmpty){
            context.router.pushAndPopUntil(const QualificationsRoute(),
                predicate: (Route<dynamic> route) => false);
          }else if(state.profileEntity!.skillIds!.skillIds!.isEmpty){
            context.router.pushAndPopUntil(const AddSkillsRoute(),
                predicate: (Route<dynamic> route) => false);
          }else if(state.profileEntity!.hourlyRate! == 0){
            context.router.pushAndPopUntil(const RateAndWorkTimesRoute(),
                predicate: (Route<dynamic> route) => false);
          }else if(state.profileEntity!.paymentDetails!.bankName!.isEmpty){
            context.router.pushAndPopUntil(const BankDetailsRoute(),
                predicate: (Route<dynamic> route) => false);
          }else if(state.profileEntity!.location!.id!.isEmpty ){
            context.router.pushAndPopUntil(const LocationRoute(),
                predicate: (Route<dynamic> route) => false);
          }else if(state.profileEntity!.description!.isEmpty){
            context.router.pushAndPopUntil(const FinalDetailsRoute(),
                predicate: (Route<dynamic> route) => false);
          }else{
           context.router.pushAndPopUntil(const BottomNavigationBarRoute(), predicate: (Route<dynamic> route) => false);

         }
        }
        //loading
        if(state is RegisterOTPCompleteState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //error
        if(state is RegisterOTPCompleteState && state.dataState == DataState.error){
          // will use error dialog
          print(state.error);
        }

        // SaveRemoteProfileDataState/////////////////////////////////////////
        //loading
        if(state is SaveRemoteProfileDataState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //success
        if(state is SaveRemoteProfileDataState && state.dataState == DataState.success){
          getBloc().add(GetProfileProgressEvent(userModel:  state.userModel));
        }
        //error
        if(state is SaveRemoteProfileDataState && state.dataState == DataState.error){
          //will use error dialog[
          print(state.error);
        }

        //GetProfileProgressState////////////////////////////////////
        //success
        if(state is GetProfileProgressState && state.dataState == DataState.success){
          Navigator.pop(context);
          getBloc().preloaderActive = false;
          getBloc().add(RegisterOTPCompleteEvent(userEntity: UserEntity(
              mobile: state.profileEntity?.mobile??"",
              surname: state.profileEntity?.surname??"",
              firstName: state.profileEntity?.firstName??"",
              email: state.profileEntity?.email??"",
              idNumber: state.profileEntity?.email??"",
              passportNumber: state.profileEntity?.passportNumber??""
          ), profileEntity: state.profileEntity));
        }

        if(state is GetProfileProgressState && state.dataState == DataState.error){

        }

        if(state is GetProfileProgressState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }


      },
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
                             length: 6,
                             onchange: (String pin){
                              getBloc().add(OTPEnteredEvent(otp: pin));
                           },),
                         ),
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
                           onPressed: !getBloc().checked?null:() {
                             getBloc().add(OTPGetTokenEvent(smsCode: getBloc().otp!,verificationId: "" ));
                           },
                           child: Text(getLocalization().ccontinue),
                         ),
                         Padding(padding: const EdgeInsets.only(top: 24, bottom: 14),
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
