
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/pay_someone_bloc.dart';

@RoutePage()
class PaySomeonePage extends BasePage {
  const PaySomeonePage({super.key});

  @override
  _PaySomeonePageState createState() => _PaySomeonePageState();
}

class _PaySomeonePageState extends BasePageState<PaySomeonePage, PaySomeoneBloc> {

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
    return BlocConsumer<PaySomeoneBloc, PaySomeonePageState>(
      listener: (context, state){},
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  wText(getLocalization().myWallet,
                      style: theme.textTheme.headlineMedium),
                  const Spacer(),
                  InkWell(onTap: (){context.router.pop();},child: const Icon(Icons.close))
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  PaySomeoneBloc initBloc() {
    return locator<PaySomeoneBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
