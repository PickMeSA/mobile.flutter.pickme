import 'dart:ui';

import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/membership_information_bloc.dart';

@RoutePage()
class MembershipInformationPage extends BasePage {
  const MembershipInformationPage({super.key});


  @override
  State<MembershipInformationPage> createState() => _MembershipInformationState();
}

class _MembershipInformationState extends BasePageState<MembershipInformationPage, MembershipInformationBloc> {
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<MembershipInformationBloc, MembershipInformationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24,right: 24, top: 56, bottom: 72),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.info_outline, size: 24,),
                      ),
                      wText(
                        getLocalization().membership.capitalizeEachWord(),
                        style: theme.textTheme.headlineMedium!.copyWith(
                            fontVariations: [
                              const FontVariation('wght', 300),
                            ]
                        ),
                      ),
                      Spacer(),
                      TertiaryButton.icon(
                          onPressed: (){
                            Navigator.pop(context);
                      }, child: Icon(Icons.close, color: theme.colorScheme.secondary))
                    ],
                  ),
                  20.height,
                  wText(getLocalization().individual, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                  5.height,
                  wText(getLocalization().lookingForJobOpportunitiesAsASingleIndividual,style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14,fontWeight: FontWeight.w400)),
                  35.height,
                ListTile(
                    dense:true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                    leading: const Icon(Iconsax.tick_square,size: 20,),
                    title: wText (getLocalization().registrationFee, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                  
                ),
                  5.height,
                  wText(getLocalization().aOneTimeFeeOf500GetYouStarted, style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14,fontWeight: FontWeight.w400)),
                  35.height,
                  ListTile(
                    dense:true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                    leading: const Icon(Iconsax.tick_square,size: 20,),
                    title: wText (getLocalization().hourlyRate, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),

                  ),
                  5.height,
                  wText(getLocalization().youHaveTheFlexibilityToSetYourOwnHourlyRate, style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14,fontWeight: FontWeight.w400)),
                  40.height,
                  AppDivider(),
                  20.height,
                  wText(getLocalization().additionalInformation, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                  5.height,
                  wText(getLocalization().lookingForJobOpportunitiesAsASingleIndividual,style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14,fontWeight: FontWeight.w400)),
                  35.height,
                  ListTile(
                    dense:true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                    leading: const Icon(Iconsax.tick_square,size: 20,),
                    title: wText (getLocalization().investmentFund, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),

                  ),
                  5.height,
                  wText(getLocalization().pickMeInvestsR4hrWorkedInAProfessionalInvestmentFundForYourFuture, style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14,fontWeight: FontWeight.w400)),
                  35.height,
                  ListTile(
                    dense:true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                    leading: const Icon(Iconsax.tick_square,size: 20,),
                    title: wText (getLocalization().transactionFees, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),

                  ),
                  5.height,
                  wText(getLocalization().pickMeReceivesAR2hrWorkedAsServiceFees, style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14,fontWeight: FontWeight.w400)),


                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  MembershipInformationBloc initBloc() {
    return locator<MembershipInformationBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }



}