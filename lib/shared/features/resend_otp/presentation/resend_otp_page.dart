
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

import 'bloc/resend_otp_bloc.dart';

@RoutePage()
class ResendOTPPage extends BasePage {
   ResendOTPPage({super.key, required this.userModel});
   UserModel userModel;
  @override
  _ResendOTPPageState createState() => _ResendOTPPageState();
}

class _ResendOTPPageState extends BasePageState<ResendOTPPage, ResendOTPBloc> {

  TextEditingController phoneNumberController = TextEditingController();
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
    return BlocConsumer<ResendOTPBloc, ResendOTPPageState>(
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
                    child:  Padding(
                      padding: EdgeInsets.all(20.0),
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
                            child: wText(getLocalization().didntReceiveACode,style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: EdgeInsets.only( right: 32, bottom: 8),
                            child: wText(getLocalization().pleaseReenterYourPhoneNumber,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                    ),)
              ),
              Positioned(bottom: 0,
                child: Container(height: MediaQuery.sizeOf(context).height * (1.8/3) ,
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
                            // validator: (value)=> validatePhoneNumber(value??""),
                            onChanged: (value)=> getBloc().add(NumberEnteredEvent(mobileNumber: value)),
                            prefixIcon: SizedBox(width: 50,
                              child: Row(
                                children: [Text(getLocalization().phonePrefix,)],
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            textFieldType: TextFieldType.NUMBER, labelText: getLocalization().phoneNumber,),
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
                          onPressed: !getBloc().checked!?null:() {
                            getBloc().add(NumberEnteredEvent(mobileNumber: phoneNumberController.text));
                          },
                          child: Text(getLocalization().submit),
                        ),
                        Padding(padding: EdgeInsets.only(top: 24, bottom: 14),
                          child: Center(
                              child: InkWell(
                                onTap: (){
                                  widget.userModel.mobile = "";
                                  context.router.push(OTPRoute(userModel: widget.userModel));
                                  } ,
                                child: wText(getLocalization().contactHelpCenter, style:
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
  ResendOTPBloc initBloc() {
    return locator<ResendOTPBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
}
