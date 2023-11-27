
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bank_details_bloc.dart';

@RoutePage()
class BankDetailsPage extends BasePage {
  const BankDetailsPage({super.key});

  @override
  _BankDetailsPageState createState() => _BankDetailsPageState();
}

class _BankDetailsPageState extends BasePageState<BankDetailsPage, BankDetailsBloc> {

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
    return BlocConsumer<BankDetailsBloc, BankDetailsPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
          );
      },
    );
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
