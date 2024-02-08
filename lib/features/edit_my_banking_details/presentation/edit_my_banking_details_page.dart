
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/bank_details/domain/entities/account_type_entity.dart';
import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/edit_my_banking_details_bloc.dart';

@RoutePage()
class EditMyBankingDetailsPage extends BasePage {
  const EditMyBankingDetailsPage({super.key, required this.bankDetailsEntity});
  final OTPPaymentDetailsEntity bankDetailsEntity;
  @override
  _EditMyBankingDetailsPageState createState() => _EditMyBankingDetailsPageState();
}

class _EditMyBankingDetailsPageState extends BasePageState<EditMyBankingDetailsPage, EditMyBankingDetailsBloc> {
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController branchCodeController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(BankDetailsPageEnteredEvent());
    accountHolderNameController. text = widget.bankDetailsEntity.accountHolderName??"";
    branchCodeController.text = widget.bankDetailsEntity.bankBranchCode??"";
  accountTypeController.text = widget.bankDetailsEntity.bankAccountType??"";
  accountNumberController.text = widget.bankDetailsEntity.bankAccountNumber??"";
  bankNameController.text = widget.bankDetailsEntity.bankName??"";
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<EditMyBankingDetailsBloc, EditMyBankingDetailsPageState>(
      listener: (context, state){
        if(state is BankDetailsSubmittedState && state.dataState == DataState.success){
          Navigator.pop(context);
          context.router.pop();
        }

        if(state is BankDetailsSubmittedState && state.dataState == DataState.loading){
          preloader(context);
        }

        if(state is BankDetailsSubmittedState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        InkWell(onTap: ()=> context.router.pop()
                            ,child: const Icon(Icons.arrow_back_rounded)),
                        20.width,
                        wText(getLocalization().editMyBankingDetails, style: theme.textTheme.titleLarge),
                      ],
                    ),
                    30.height,
                    AppTextFormField(
                      validator: (value){
                        if(value!.isEmpty)
                          return "Account number is required";
                        String pattern =
                            r'^[0-9]';
                        RegExp regex =  RegExp(pattern);
                        if(!regex.hasMatch(value))
                          return "Please enter a valid account number";
                      },
                      onChanged: (value)=> getBloc().add(BankDetailsValueChangedEvent(bankDetailsEntity: getFormData())),
                      controller: accountNumberController,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      textFieldType: TextFieldType.NUMBER,
                      labelText: getLocalization().accountNumberA,),
                    20.height,
                    AppTextFormField(
                      validator: (value){
                        if(value!.isEmpty)
                          return "branch code is required";
                        String pattern =
                            r'^[0-9]';
                        RegExp regex =  RegExp(pattern);
                        if(!regex.hasMatch(value))
                          return "Please enter a valid branch";

                      },
                      onChanged: (value)=> getBloc().add(BankDetailsValueChangedEvent(bankDetailsEntity: getFormData())),
                      controller: branchCodeController,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      textFieldType: TextFieldType.NUMBER,
                      labelText: getLocalization().branchCodeA,),
                    20.height,
                    AppTextFormField(
                      onChanged: (value)=> getBloc().add(BankDetailsValueChangedEvent(bankDetailsEntity: getFormData())),
                      controller: accountHolderNameController,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      textFieldType: TextFieldType.NAME,
                      labelText: getLocalization().accountHolderName,),
                    20.height,
                    AppTextFormField(
                      onChanged: (value)=> getBloc().add(BankDetailsValueChangedEvent(bankDetailsEntity: getFormData())),
                      controller: bankNameController,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      textFieldType: TextFieldType.NAME,
                      labelText: getLocalization().bankA,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: AppDropdownMenu<AccountTypeEntity>(
                        controller: accountTypeController,
                        label: wText(getLocalization().accountTypeA),
                        enableFilter: true,
                        dropdownMenuEntries:getBloc().accountTypeEntityEntries??[],
                        width: MediaQuery.of(context).size.width-40,),
                    ),


                    100.height,

                    Row(
                      children: [
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
                                        (Set<MaterialState> states) {
                                      return Colors.white;
                                    }
                                )
                            ),
                            onPressed:() { context.router.pop();
                            },
                            child: Text(getLocalization().cancel, style: TextStyle(color: theme.colorScheme.secondary)),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: PrimaryButton(
                            style: ButtonStyle(
                                side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                  return BorderSide(
                                    color: states.contains(MaterialState.disabled)?
                                    theme.colorScheme.primary.withOpacity(0):
                                    theme.colorScheme.primary,
                                    width: 2,
                                  );
                                }
                                ),
                                backgroundColor: MaterialStateProperty.resolveWith(
                                        (Set<MaterialState> states){
                                      return states.contains(MaterialState.disabled)?
                                      theme.colorScheme.primary.withOpacity(0.3):
                                      theme.colorScheme.primary;
                                    }
                                )
                            ),
                            onPressed: !getBloc().checked?null:() {
                              if(_key.currentState!.validate()) {
                                getBloc().add(BankDetailsSubmittedEvent(
                                    bankDetailsEntity: getFormData()));
                              }
                              // context.router.push(const LocationRoute());
                            },
                            child: Text(getLocalization().save),
                          ),
                        ),
                      ],
                    )



                  ],
                ),
              ),
            ),
          )  ,
        );
      },
    );
  }


  @override
  EditMyBankingDetailsBloc initBloc() {
    return locator<EditMyBankingDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  BankDetailsEntity getFormData (){
    return BankDetailsEntity(
      accountHolderName: accountHolderNameController.text,
        accountNumber: accountNumberController.text,
        accountType: accountTypeController.text,
        bank: bankNameController.text,
        branchCode: branchCodeController.text);
  }


}
