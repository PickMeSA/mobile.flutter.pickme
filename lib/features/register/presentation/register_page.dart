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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Form(
        child: Column(
          children:[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20 , top: 10, bottom: 10),
            child: TextFormField(decoration: InputDecoration(hintText: getLocalization().firstName,))
            ,
          ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20 , top: 10, bottom: 10),
              child: TextFormField(decoration: InputDecoration(hintText: getLocalization().surname))
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20 , top: 10, bottom: 10),
              child: TextFormField(decoration: InputDecoration(hintText: getLocalization().phoneNumber))
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20 , top: 10, bottom: 10),
              child: TextFormField(decoration: InputDecoration(hintText: getLocalization().emailAddress))
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20 , top: 10, bottom: 10),
              child:TextFormField(decoration: InputDecoration(hintText: getLocalization().idNumber))
            ),
            const Spacer(),

            ElevatedButton(onPressed: (){
            /*  getBloc().add(ContinueClickedEvent(user: User(
                email: "fmathebula@dvtsoftware.com",
                workPermitNumber: "",
                surname: "DVT",
                subscriptionType: "",
                profileType: "",
                passportNumber: "",
                mobile: "436547673575375",
                idNumber: "546764867674",
                firstName: "Freedom"
              )));*/
            }, child:Text(getLocalization().ccontinue) )
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
