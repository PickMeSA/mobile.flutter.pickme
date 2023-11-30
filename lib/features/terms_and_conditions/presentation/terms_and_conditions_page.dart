import 'dart:ui';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/terms_and_conditions_bloc.dart';

@RoutePage()
class TermsAndConditionsPage extends BasePage {
  const TermsAndConditionsPage({super.key});


  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends BasePageState<TermsAndConditionsPage, TermsAndConditionsBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(GetRemoteTermsAndConditionsEvent());
  }
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<TermsAndConditionsBloc, TermsAndConditionsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state is GetRemoteTermsAndConditionsState && state.dataState == DataState.success?
          SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: EdgeInsets.only(left: 24,right: 24, top: 56, bottom: 72),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getLocalization().termsAndConditions.capitalizeEachWord(),
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
                    child: wText(
                      getBloc().termsAndConditionsEntity.termsAndConditions
                    ),
                  ),
                ),
              ],
            ),
          ),
        ): state is GetRemoteTermsAndConditionsState && state.dataState == DataState.loading?
        Container(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ):
        state is GetRemoteTermsAndConditionsState && state.dataState == DataState.error?
        Container(child: wText(state.error!),): Container();
      },
    );
  }

  @override
  TermsAndConditionsBloc initBloc() {
    return locator<TermsAndConditionsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }



}