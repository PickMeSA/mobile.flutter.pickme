
import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_text.dart';

@RoutePage()
class MinimumWagePage extends BasePage {
  const MinimumWagePage({super.key});

  @override
  State<MinimumWagePage> createState() => _MinimumWagePageState();
}

class _MinimumWagePageState extends BasePageState<MinimumWagePage, MinimumWageBloc> {

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
    return BlocConsumer<MinimumWageBloc, MinimumWagePageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
           width: MediaQuery.sizeOf(context).width,
           height: MediaQuery.sizeOf(context).height,
           child: Padding(
             padding: EdgeInsets.only(left: 24,right: 24, top: 56, bottom: 72),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      Icon(Icons.info_outline, color: theme.colorScheme.secondary),
                     wText(
                       getLocalization().minimumWage.capitalizeEachWord(),
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
                 2.height,
                 wText(getLocalization().southAfricanMinimumWage, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                 32.height,
                 Expanded(
                   child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         wText(
                             getLocalization().minimumWageText1,
                           style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey)
                         ),
                         20.height,
                         wText(
                           getLocalization().ePWP,
                           style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey , fontWeight: FontWeight.w700),
                         ),
                         wText(
                             getLocalization().minimumWageText2,
                             style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey)
                         ),
                       ],
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
  MinimumWageBloc initBloc() {
    return locator<MinimumWageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
