
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/reschedule_selection_response_bloc.dart';

@RoutePage()
class RescheduleSelectionResponsePage extends BasePage {
  final bool approved;
  const RescheduleSelectionResponsePage({super.key, required this.approved});

  @override
  _RescheduleSelectionResponsePageState createState() => _RescheduleSelectionResponsePageState();
}

class _RescheduleSelectionResponsePageState extends BasePageState<RescheduleSelectionResponsePage, RescheduleSelectionResponseBloc> {

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
    return BlocConsumer<RescheduleSelectionResponseBloc, RescheduleSelectionResponsePageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
          );
      },
    );
  }


  @override
  RescheduleSelectionResponseBloc initBloc() {
    return locator<RescheduleSelectionResponseBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
