import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/register/domain/entities/user/user.dart';
import 'package:pickme/features/register/presentation/bloc/register__bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


@RoutePage()
class RegisterPage extends BasePage {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BasePageState<RegisterPage,RegisterBloc> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();

  @override
  Widget buildView(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Form(
        child: Stack(
          children:[
            Positioned(top: 0,child:
            Container(
              color: Colors.grey,
              height: MediaQuery.sizeOf(context).height *(1/3) ,
              width: MediaQuery.sizeOf(context).width,)),

            Positioned(bottom: 0,
              child: Container(height: MediaQuery.sizeOf(context).height * (2/3) ,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
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
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  10),
                          textFieldType: TextFieldType.NAME, labelText: getLocalization().firstName,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( top: 10, bottom:  10),
                        child: AppTextFormField(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  10),
                          textFieldType: TextFieldType.NAME, labelText: getLocalization().surname,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom:  10),
                        child: AppTextFormField(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  10),
                          textFieldType: TextFieldType.NAME, labelText: getLocalization().phoneNumber,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( top: 10, bottom:  10),
                        child: AppTextFormField(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  10),
                          textFieldType: TextFieldType.NAME, labelText: getLocalization().emailAddress,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom:  10),
                        child: AppTextFormField(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  10),
                          textFieldType: TextFieldType.NAME, labelText: getLocalization().idNumber,),
                      ),
                    ],
                  ),
                ),
              ),
            ),





            Positioned(
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,top: 10, bottom: 10),
                child: PrimaryButton(width: MediaQuery.sizeOf(context).width - 45,onPressed: () async {
                },
                    child: Text(getLocalization().ccontinue)),
              ),
            ),
        ],
      ),
    ),
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
 
}
