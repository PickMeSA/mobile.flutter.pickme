
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/w_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'bloc/my_wallet_bloc.dart';

@RoutePage()
class MyWalletPage extends BasePage {
  const MyWalletPage({super.key});

  @override
  _MyWalletPageState createState() => _MyWalletPageState();
}

class _MyWalletPageState extends BasePageState<MyWalletPage, MyWalletBloc> {

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
    return BlocConsumer<MyWalletBloc, MyWalletPageState>(

      listener: (context, state){},
      builder: (context, state) {

        ThemeData theme = Theme.of(context);
         return Padding(
           padding: const EdgeInsets.all(20),
           child:  Column(
             children: [
               Row(
                 children: [
                   const Icon(Iconsax.wallet_2),
                   10.width,
                   wText(getLocalization().myWallet,
                       style: theme.textTheme.headlineMedium),
                   const Spacer(),
                   InkWell(onTap: (){context.router.pop();},child: const Icon(Icons.menu)),

                 ]
               ),
               InkWell(
                 onTap: ()=> context.router.push(PaySomeoneWebViewRoute()),
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: SizedBox(
                     height: 230,
                     child: AppSectionCard(title: getLocalization().pay,
                       color: WColors.pickMeBlue,
                       icon:Icon(Iconsax.card_send, color: Colors.white,size: 20) ,
                     ),
                   ),
                 ),
               ),

               InkWell(
                 onTap: ()=> context.router.push(MyBankingDetailsRoute()),
                 child: Padding(
                   padding: const EdgeInsets.all(20),
                   child: SizedBox(
                     height: 230,
                     child: AppSectionCard(title: getLocalization().myBankingDetails,
                       color: theme.primaryColor,
                       icon:const Icon(Iconsax.receipt_edit, color: Colors.white,size: 20) ,
                     ),
                   ),
                 ),
               ),
             ],
           ),
         );
      },
    );
  }


  @override
  MyWalletBloc initBloc() {
    return locator<MyWalletBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
