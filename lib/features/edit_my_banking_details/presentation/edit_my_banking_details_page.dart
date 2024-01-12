
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/edit_my_banking_details_bloc.dart';

@RoutePage()
class EditMyBankingDetailsPage extends BasePage {
  const EditMyBankingDetailsPage({super.key});

  @override
  _EditMyBankingDetailsPageState createState() => _EditMyBankingDetailsPageState();
}

class _EditMyBankingDetailsPageState extends BasePageState<EditMyBankingDetailsPage, EditMyBankingDetailsBloc> {

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
    return BlocConsumer<EditMyBankingDetailsBloc, EditMyBankingDetailsPageState>(
      listener: (context, state){},
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(onTap: (){context.router.pop();},child: const Icon(Icons.arrow_back_rounded)),
                  10.width,
                  wText(getLocalization().editMyBankingDetails,
                      style: theme.textTheme.headlineMedium),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  EditMyBankingDetailsBloc initBloc() {
    return locator<EditMyBankingDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
