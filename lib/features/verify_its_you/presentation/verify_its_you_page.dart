
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/verify_its_you_bloc.dart';

@RoutePage()
class VerifyItsYouPage extends BasePage {
  const VerifyItsYouPage({super.key});

  @override
  _VerifyItsYouPageState createState() => _VerifyItsYouPageState();
}

class _VerifyItsYouPageState extends BasePageState<VerifyItsYouPage, VerifyItsYouBloc> {

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
    return BlocConsumer<VerifyItsYouBloc, VerifyItsYouPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
          );
      },
    );
  }


  @override
  VerifyItsYouBloc initBloc() {
    return locator<VerifyItsYouBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
