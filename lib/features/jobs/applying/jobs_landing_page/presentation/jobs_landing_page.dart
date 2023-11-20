import 'package:flutter/gestures.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/Jobs/applying/jobs_landing_page/domain/entities/subscription_plan_entity.dart';
import 'package:pickme/features/Jobs/applying/jobs_landing_page/presentation/bloc/jobs_landing_page_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'package:pickme/shared/widgets/w_page_padding.dart';

@RoutePage()
class JobsLandingPage extends BasePage {
  const JobsLandingPage({super.key});


  @override
  State<JobsLandingPage> createState() => _JobsLandingPageState();
}

class _JobsLandingPageState extends BasePageState<JobsLandingPage, JobsLandingPageBloc> {
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<JobsLandingPageBloc, JobsLandingPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppExplorationTile(
                title: getLocalization().myJobRequests,
                count: 0,
                onClick: (){},
              ),
              Row(
                children: [
                  Expanded(
                    child: wText(
                      getLocalization().selectMembership,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  TertiaryButton(onPressed: (){
                    context.router.push(const MembershipInformationRoute());
                  },
                      child: Icon(Icons.info_outline, color: theme.colorScheme.secondary,)
                  )
                ],
              ),
              30.height,
              Column(
                children: mockSubscriptionPlans.map((plan) => AppSubscriptionPlan(
                  price: "R${plan.price}",
                  subscriptionType: plan.subscriptionType,
                  entityType: plan.entityType,
                  selected: true,
                  includedItems: plan.includedItems,
                )).toList(),
              ),
              const Expanded(child: SizedBox()),
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
                  SizedBox(
                    height: 56,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: theme.colorScheme.secondary,
                            width: 2,
                          ),
                        ),
                        foregroundColor: MaterialStateProperty.all(theme.colorScheme.secondary)
                      ),
                      onPressed: (){
                        context.router.pop();
                      },
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                  ),
                  16.width,
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
                          context.router.push(QualificationsRoute());
                        },
                        child: Text(getLocalization().nextStep),
                      ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  JobsLandingPageBloc initBloc() {
    return locator<JobsLandingPageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}