
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sign_up_bloc.dart';

@RoutePage()
class SignUpPage extends BasePage {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPage, SignUpBloc> {

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
    return BlocConsumer<SignUpBloc, SignUpPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
          );
      },
    );
  }


  @override
  SignUpBloc initBloc() {
    return locator<SignUpBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
}
