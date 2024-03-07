import 'package:flutter/gestures.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import '../../../shared/widgets/w_page_padding.dart';
import '../domain/entities/subscription_plan_entity.dart';
import 'bloc/register_account_step1_bloc.dart';

@RoutePage()
class RegisterAccountStep1Page extends BasePage {
  const RegisterAccountStep1Page({super.key});


  @override
  State<RegisterAccountStep1Page> createState() => _RegisterAccountStep1State();
}

class _RegisterAccountStep1State extends BasePageState<RegisterAccountStep1Page, RegisterAccountStep1Bloc> {
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<RegisterAccountStep1Bloc, RegisterAccountStep1State>(
      listener: (context, state) {
        if(state.dataState == DataState.loading && state is SubmitAcceptedTermsAndConditionsState){
          preloader(context);
        }
        if(state.dataState == DataState.success && state is SubmitAcceptedTermsAndConditionsState){
          Navigator.pop(context);
         if (state.profileEntity!.qualifications!.isEmpty &&
              state.profileEntity!.workExperience!.isEmpty){
            context.router.push( QualificationsRoute(profileEntity: state.profileEntity!));
          }else if(state.profileEntity!.skills!.isEmpty){
            context.router.push( AddSkillsRoute(profileEntity:  state.profileEntity!));
          }else if(state.profileEntity!.hourlyRate! == 0){
            context.router.push(const RateAndWorkTimesRoute());
          }else if(state.profileEntity!.paymentDetails!.bankName!.isEmpty){
            context.router.push(const BankDetailsRoute());
          }else if(state.profileEntity!.location!.address == "" ){
            context.router.push(const LocationRoute(),);
          }else if(state.profileEntity!.description!.isEmpty) {
            context.router.push(const FinalDetailsRoute());
          }else if(!state.profileEntity!.subscriptionPaid!){
            context.router.push( PaySomeoneWebViewRoute(from: 0));}
          else{
            context.router.pushAndPopUntil( BottomNavigationBarRoute(), predicate: (Route<dynamic> route) => false);
          }
        }
        if(state.dataState == DataState.error && state is SubmitAcceptedTermsAndConditionsState){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
        //  padding: wPagePadding(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wText(
                    getLocalization().step1,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      color: theme.primaryColor,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: wText(
                          getLocalization().letsOnboardYou,
                          style: theme.textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ],
                  ),
                  30.height,
                  Column(
                    children: mockSubscriptionPlans.map((plan) =>
                        AppSubscriptionPlan(
                      price: "${getLocalization().r}${plan.price.toStringAsFixed(2)}",
                      subscriptionType: plan.subscriptionType,
                      entityType: plan.entityType,
                      selected: true,
                      includedItems: plan.includedItems,
                          onInformationClick: ()=>context.router.push(const MembershipInformationRoute()),
                    )).toList(),
                  ),
                  10.height,
                  Row(
                    children: [
                      AppCheckbox(value: state.checked, onChanged: (bool? checked){
                        getBloc().add(TermsAndConditionsToggledEvent());
                      }),
                      16.width,
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "${getLocalization().iHaveReadThe} ",
                                    style: theme.textTheme.bodyMedium
                                ),

                                TextSpan(
                                    text: getLocalization().termsAndConditions,
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.router.push(const TermsAndConditionsRoute());
                                      }
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  40.height,
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
                          onPressed: !state.checked?null:() {
                            getBloc().add(SubmitAcceptedTermsAndConditionsEvent());
                          },
                          child: Text(getLocalization().nextStep),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  RegisterAccountStep1Bloc initBloc() {
    return locator<RegisterAccountStep1Bloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }



}