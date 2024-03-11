
import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/id_reason_bloc.dart';

@RoutePage()
class IdReasonPage extends BasePage {
  const IdReasonPage({super.key});

  @override
  _IdReasonPageState createState() => _IdReasonPageState();
}

class _IdReasonPageState extends BasePageState<IdReasonPage, IdReasonBloc> {

  @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<IdReasonBloc, IdReasonPageState>(
      listener: (context, state){},
      builder: (context, state) {
        return   SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24,right: 24, top: 56, bottom: 72),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.info_outline, size: 24,),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width -150,
                        child: wText(

                          getLocalization().onlineIdVerification,
                          style: theme.textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontVariations: [
                                const FontVariation('wght', 300),
                              ]
                          ),
                        ),
                      ),
                      Spacer(),
                      TertiaryButton.icon(
                          onPressed: (){
                            Navigator.pop(context);
                          }, child: Icon(Icons.close, color: theme.colorScheme.secondary))
                    ],
                  ),
                  30.height,
                  Container(
                    width: MediaQuery.sizeOf(context).width ,
                    child: wText(

                      getLocalization().idVerificationIdChecksOrIdentityVerification,
                      style: theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontVariations: [
                            const FontVariation('wght', 300),
                          ]
                      ),
                    ),
                  ),
                  20.height,
                  Container(
                    width: MediaQuery.sizeOf(context).width ,
                    child: wText(

                      getLocalization().identityIsTheAttribute,
                      style: theme.textTheme.titleSmall!.copyWith(

                          fontVariations: [
                            const FontVariation('wght', 300),
                          ]
                      ),
                    ),
                  ),
                  20.height,
                  Container(
                    width: MediaQuery.sizeOf(context).width -150,
                    child: wText(

                      getLocalization().soHowDoesItWork,
                      style: theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontVariations: [
                            const FontVariation('wght', 300),
                          ]
                      ),
                    ),
                  ),
                  10.height,
                  Container(
                    width: MediaQuery.sizeOf(context).width ,
                    child: wText(

                      getLocalization().aMandatoryIdPassport,
                      style: theme.textTheme.titleSmall!.copyWith(

                          fontVariations: [
                            const FontVariation('wght', 300),
                          ]
                      ),
                    ),
                  ),
                  20.height,
                  Container(
                    width: MediaQuery.sizeOf(context).width -150,
                    child: wText(
                      getLocalization().howDoiKnowIfMyDataIsSecure,
                      style: theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontVariations: [
                            const FontVariation('wght', 300),
                          ]
                      ),
                    ),
                  ),
                  10.height,
                  Container(
                    width: MediaQuery.sizeOf(context).width ,
                    child: wText(

                      getLocalization().whenAUserRegistersOnTheApp,
                      style: theme.textTheme.titleSmall!.copyWith(

                          fontVariations: [
                            const FontVariation('wght', 300),
                          ]
                      ),
                    ),
                  ),

                  20.height,
                  Container(
                    width: MediaQuery.sizeOf(context).width -150,
                    child: wText(
                      getLocalization().whyDoesPickMeNeedMyWorkPermitNumber,
                      style: theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontVariations: [
                            const FontVariation('wght', 300),
                          ]
                      ),
                    ),
                  ),
                  10.height,
                  Container(
                    width: MediaQuery.sizeOf(context).width ,
                    child: wText(

                      getLocalization().foreignNationalRequiresAWork,
                      style: theme.textTheme.titleSmall!.copyWith(

                          fontVariations: [
                            const FontVariation('wght', 300),
                          ]
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  IdReasonBloc initBloc() {
    return locator<IdReasonBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
}
