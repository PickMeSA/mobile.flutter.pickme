
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
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
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
  TextEditingController bankAccountHolderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getBloc().add(BankDetailsPageEnteredEvent());
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<BankDetailsBloc, BankDetailsPageState>(
      listener: (context, state){
        if(state is BankDetailsSubmittedState && state.dataState == DataState.success){
          Navigator.pop(context);
          getBloc().preloaderActive = false;
          if(state.profileEntity!.location!.address ==""){
            context.router.push(const LocationRoute());
          }else if(state.profileEntity!.description!.isEmpty){
            context.router.push(const FinalDetailsRoute());
          }else if(!state.profileEntity!.subscriptionPaid!) {
            context.router.push( PaySomeoneWebViewRoute(from: 0));
          }else{
            context.router.pushAndPopUntil( BottomNavigationBarRoute(), predicate: (Route<dynamic> route) => false);
          }
        }

        if(state is BankDetailsSubmittedState && state.dataState == DataState.loading ){
          preloader(context);
          getBloc().preloaderActive = true;
        }

        if(state is BankDetailsSubmittedState && state.dataState == DataState.error ){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
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
                    controller: bankAccountHolderController,
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
                      enableFilter: false,
                      filled: true,
                      dropdownMenuEntries:getBloc().accountTypeEntityEntries??[],
                      width: MediaQuery.of(context).size.width-40,),
                  ),
                  20.height,
                  AppTextFormField(
                    onChanged: (value)=> getBloc().add(BankDetailsValueChangedEvent(bankDetailsEntity: getFormData())),
                    controller: accountNumberController,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    textFieldType: TextFieldType.NAME,
                    labelText: getLocalization().accountNumberA,),
                  20.height,
                  AppTextFormField(
                    onChanged: (value)=> getBloc().add(BankDetailsValueChangedEvent(bankDetailsEntity: getFormData())),
                    controller: branchCodeController,
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
                            getBloc().add(BankDetailsSubmittedEvent(bankDetailsEntity: getFormData()));
                            // context.router.push(const LocationRoute());
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
      accountHolderName: bankAccountHolderController.text,
        accountNumber: accountNumberController.text,
        accountType: accountTypeController.text,
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
