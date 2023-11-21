
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/add_skills_bloc.dart';

@RoutePage()
class AddSkillsPage extends BasePage {
  const AddSkillsPage({super.key});

  @override
  _AddSkillsPageState createState() => _AddSkillsPageState();
}
class _AddSkillsPageState extends BasePageState<AddSkillsPage, AddSkillsBloc> {

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
    return BlocConsumer<AddSkillsBloc, AddSkillsPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
          );
      },
    );
  }


  @override
  AddSkillsBloc initBloc() {
    return locator<AddSkillsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

}
