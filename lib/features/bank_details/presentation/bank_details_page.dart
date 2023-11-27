
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/bank_details/entities/bank_details_entities.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/constants/w_colors.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/bank_details_bloc.dart';

@RoutePage()
class BankDetailsPage extends BasePage {
  const BankDetailsPage({super.key});

  @override
  _BankDetailsPageState createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends BasePageState<BankDetailsPage, BankDetailsBloc> {

  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController branchCodeController = TextEditingController();

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
    ThemeData theme = Theme.of(context);
    return BlocConsumer<BankDetailsBloc, BankDetailsPageState>(
      listener: (context, state){},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  wText(getLocalization().step5,style:theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: theme.primaryColor
                  )),
                  const SizedBox(height: 10,),
                  wText(getLocalization().bankDetails,style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
              30.height,
            AppTextFormField(
              onChanged: (value)=> getBloc().add(BankDetailsValueChangedEvent(bankDetailsEntity: getFormData())),
              controller: bankNameController,
              padding: const EdgeInsets.only(left: 20, right: 20),
              textFieldType: TextFieldType.NAME,
              labelText: getLocalization().bankA,),


                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: AppDropdownMenu<String>(

                      label: wText(getLocalization().accountTypeA),
                      enableFilter: true,
                      dropdownMenuEntries:[],
                      width: MediaQuery.of(context).size.width-40,),

                  ),
                  20.height,
                  AppTextFormField(
                    onChanged: (value)=> getBloc().add(BankDetailsValueChangedEvent(bankDetailsEntity: getFormData())),
                    controller: bankNameController,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    textFieldType: TextFieldType.NAME,
                    labelText: getLocalization().accountNumberA,),
                  20.height,
                  AppTextFormField(
                    onChanged: (value)=> getBloc().add(BankDetailsValueChangedEvent(bankDetailsEntity: getFormData())),
                    controller: bankNameController,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    textFieldType: TextFieldType.NAME,
                    labelText: getLocalization().branchCodeA,),

                    100.height,

                  Row(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2,
                                color: Colors.black),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: InkWell(onTap: ()=> context.router.pop(),child: const Icon(Icons.arrow_back)) ,

                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: PrimaryButton(
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
                           // context.router.push(const RateAndWorkTimesRoute());
                          },
                          child: Text(getLocalization().nextStep),
                        ),
                      ),
                    ],
                  )



                ],
              ),
            ),
          )  ,
        );
      },
    );
  }

  BankDetailsEntity getFormData (){
    return BankDetailsEntity(
        accountNumber: accountNumberController.text,
        accountnUmber: accountNumberController.text,
        bank: bankNameController.text,
        branchCode: branchCodeController.text);
  }


  @override
  BankDetailsBloc initBloc() {
    return locator<BankDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
