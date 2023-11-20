import 'dart:ui';

import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

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
          child: Padding(
            padding: const EdgeInsets.only(left: 24,right: 24, top: 56, bottom: 72),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.info_outline),
                    Text(
                      getLocalization().membership.capitalizeEachWord(),
                      style: theme.textTheme.headlineMedium!.copyWith(
                          fontVariations: [
                            const FontVariation('wght', 300),
                          ]
                      ),
                    ),
                    TertiaryButton.icon(
                        onPressed: (){
                          Navigator.pop(context);
                    }, child: Icon(Icons.close, color: theme.colorScheme.secondary))
                  ],
                ),
                32.height,
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                        getLocalization().longDemoText
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
  MembershipInformationBloc initBloc() {
    return locator<MembershipInformationBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}