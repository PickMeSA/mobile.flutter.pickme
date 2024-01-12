
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_bank_details_card.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/my_banking_details_bloc.dart';

@RoutePage()
class MyBankingDetailsPage extends BasePage {
  const MyBankingDetailsPage({super.key});

  @override
  _MyBankingDetailsPageState createState() => _MyBankingDetailsPageState();
}

class _MyBankingDetailsPageState extends BasePageState<MyBankingDetailsPage, MyBankingDetailsBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(GetBankingDetailsEvent());
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<MyBankingDetailsBloc, MyBankingDetailsPageState>(
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
                  wText(getLocalization().myBankingDetails,
                      style: theme.textTheme.headlineMedium),
                ],
              ),
              10.height,
              getBloc().otpPaymentDetailsEntity != null?
              wBankDetailsCard(
                onTap: ()=> context.router.push(EditMyBankingDetailsRoute()),
                theme: theme,
                  accountName: getBloc().otpPaymentDetailsEntity!.bankAccountNumber!,
                  bankName: getBloc().otpPaymentDetailsEntity!.bankName!,
                  accountType: getBloc().otpPaymentDetailsEntity!.bankAccountType!,
                  accountNumber: getBloc().otpPaymentDetailsEntity!.bankAccountNumber!):
              const SizedBox(),
              10.height,


            ],
          ),
        );
      },
    );
  }


  @override
  MyBankingDetailsBloc initBloc() {
    return locator<MyBankingDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
