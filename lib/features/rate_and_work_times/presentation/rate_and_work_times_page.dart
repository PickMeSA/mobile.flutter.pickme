
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/rate_and_work_times_bloc.dart';

@RoutePage()
class RateAndWorkTimesPage extends BasePage {
  const RateAndWorkTimesPage({super.key});

  @override
  _RateAndWorkTimesPageState createState() => _RateAndWorkTimesPageState();
}

class _RateAndWorkTimesPageState extends BasePageState<RateAndWorkTimesPage, RateAndWorkTimesBloc> {

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
    return BlocConsumer<RateAndWorkTimesBloc, RateAndWorkTimesPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
          );
      },
    );
  }


  @override
  RateAndWorkTimesBloc initBloc() {
    return locator<RateAndWorkTimesBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
