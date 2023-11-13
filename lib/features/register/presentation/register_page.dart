import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
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


@RoutePage()
class RegisterPage extends BasePage {
  const RegisterPage({super.key});

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
  listener: (context, state) {
  },
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
              color: Colors.grey,
              height: MediaQuery.sizeOf(context).height * (1/3) ,
              width: MediaQuery.sizeOf(context).width,
                child:  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: InkWell(onTap: ()=> context.router.pop(),
                            child: const Icon(Icons.arrow_back)),),
                      const Padding(padding: EdgeInsets.only(top: 56,left: 32, right: 32, bottom: 8),)
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
                  padding: const EdgeInsets.only(top:30.0, bottom: 20, left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only( top: 10, bottom:  10),
                          child: AppTextFormField(
                            validator: (value)=> validateName(value??""),
                            controller: firstNameController,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            textFieldType: TextFieldType.NAME, labelText: getLocalization().firstName,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( top: 10, bottom:  10),
                          child: AppTextFormField(
                            validator: (value)=> validateSurname(value??""),
                            controller: surnameController,
                            padding: const EdgeInsets.only(left: 20, right: 20,),
                            textFieldType: TextFieldType.NAME, labelText: getLocalization().surname,),
                        ),
                       Padding(
                          padding: const EdgeInsets.only(top: 10, bottom:  10),
                          child: AppTextFormField(
                           // validator: (value)=> validatePhoneNumber(value??""),
                            prefixIcon: SizedBox(width: 50,
                              child: Row(
                                children: [Text(getLocalization().phonePrefix,)],
                              ),
                            ),
                            controller: phoneNumberController,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            textFieldType: TextFieldType.NUMBER, labelText: getLocalization().phoneNumber,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( top: 10, bottom: 10),
                          child: AppTextFormField(
                            validator:(value)=> validateEmailAddress(value??""),
                            controller: emailAddressController,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            textFieldType: TextFieldType.EMAIL, labelText: getLocalization().emailAddress,),
                        ),
                        AppTabBar(
                          viewHeight:192,
                          tabs:  <Widget>[
                            Text(getLocalization().idNumber),
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
                                    validator: (value)=> validateIdNumber(value??""),
                                    controller: idNumberController,
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  5),
                                    textFieldType: TextFieldType.NAME, labelText: getLocalization().idNumber,),
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
                                    validator: (value)=> validatePassportNumber(value??""),
                                    controller: passportNumberController,
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  5),
                                    textFieldType: TextFieldType.NAME, labelText: getLocalization().passPortNumberA,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only( top: 10, bottom:  5),
                                  child: AppTextFormField(
                                    controller: workPermitController,
                                     validator: (value)=> validateWorkPermitNumber(value??""),
                                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10,  ),
                                    textFieldType: TextFieldType.NAME, labelText: getLocalization().workPermitNumber,),
                                ),
                                Text(getLocalization().indicatesARequiredField),
                              ],
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: PrimaryButton(width: MediaQuery.sizeOf(context).width - 45,
                              onPressed: () async {
                                if(_formKey.currentState!.validate()) {
                                  UserModel userModel = UserModel(
                                      firstName: firstNameController.text,
                                      idNumber: idNumberController.text,
                                      mobile: phoneNumberController.text,
                                      email: emailAddressController.text,
                                      passportNumber: passportNumberController
                                          .text,
                                      surname: surnameController.text,
                                      workPermitNumber: workPermitController
                                          .text
                                  );
                                  getBloc().add(
                                  ContinueClickedEvent(user: userModel
                                  )
                              );
                                  context.router.push(OtpRoute(userModel:userModel));
                            }
                          },
                              child: Text(getLocalization().ccontinue)),
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
  RegisterBloc initBloc() {
    return locator<RegisterBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

}
