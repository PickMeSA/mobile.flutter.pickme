import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/pending_profile_bloc.dart';

@RoutePage()
class PendingProfilePage extends BasePage {
  const PendingProfilePage({super.key});


  @override
  State<PendingProfilePage> createState() => _PendingProfilePageState();
}

class _PendingProfilePageState extends BasePageState<PendingProfilePage, PendingProfileBloc> {
  @override
  Widget buildView(BuildContext context) {


    return BlocConsumer<PendingProfileBloc, PendingProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        var theme = Theme.of(context);
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: const EdgeInsets.only(right: 20,left: 20,top: 50.0, bottom: 10),
          child: Column(
            children: [
              Text(
                  getLocalization().yourProfileIsStillPending,
                  style: theme.textTheme.headlineLarge
              ),
              24.height,
              Text(
                getLocalization().weAreStillVerifyingYourAccount,
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium,
                softWrap: true,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/man_woman_with_phones.png"),
                      )
                  ),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width - 40,
                  ),
                ),
              ),
              SecondaryButtonDark(
                  width: MediaQuery.sizeOf(context).width - 45 ,
                  onPressed: ()=> Navigator.pop(context),
                  child: wText(getLocalization().iUnderstand),color: theme.colorScheme.secondary)
            ],
          ),
        );
      },
    );
  }

  @override
  PendingProfileBloc initBloc() {
    return locator<PendingProfileBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}