
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/alternative_request_response_bloc.dart';

@RoutePage()
class AlternativeRequestResponsePage extends BasePage {
  const AlternativeRequestResponsePage({super.key});

  @override
  _AlternativeRequestResponsePageState createState() => _AlternativeRequestResponsePageState();
}

class _AlternativeRequestResponsePageState extends BasePageState<AlternativeRequestResponsePage, AlternativeRequestResponseBloc> {

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
    return BlocConsumer<AlternativeRequestResponseBloc, AlternativeRequestResponsePageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
          );
      },
    );
  }


  @override
  AlternativeRequestResponseBloc initBloc() {
    return locator<AlternativeRequestResponseBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
