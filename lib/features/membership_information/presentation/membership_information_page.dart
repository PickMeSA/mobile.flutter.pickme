import 'dart:ui';

import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/membership_information/presentation/widgets/w_membership_information.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/membership_information_bloc.dart';

@RoutePage()
class MembershipInformationPage extends BasePage {
  const MembershipInformationPage({super.key});
  
  @override
  State<MembershipInformationPage> createState() => _MembershipInformationState();
}

class _MembershipInformationState extends BasePageState<MembershipInformationPage, MembershipInformationBloc> {
  
  @override
  void initState() {
    super.initState();
    getBloc().add(GetMembershipInformationEvent());
  }
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<MembershipInformationBloc, MembershipInformationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state is GetMembershipInformationState && state.dataState == DataState.success?
          SizedBox(
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
                      wText(
                        getLocalization().membership.capitalizeEachWord(),
                        style: theme.textTheme.headlineMedium!.copyWith(
                            fontVariations: [
                              const FontVariation('wght', 300),
                            ]
                        ),
                      ),
                      Spacer(),
                      TertiaryButton.icon(
                          onPressed: (){
                            Navigator.pop(context);
                      }, child: Icon(Icons.close, color: theme.colorScheme.secondary))
                    ],
                  ),
                  ListView.builder(itemCount: getBloc().membershipInformationEntity.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context , index){
                    return wMembershipInformation(
                      context: context,
                      membershipInformationEntity: getBloc().membershipInformationEntity[index],
                      theme: theme
                    );
                  })
                ],
              ),
            ),
          ),
        ): state is MembershipInformationState && state.dataState == DataState.loading? const SizedBox(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ): state is MembershipInformationState && state.dataState == DataState.error?Container(
          child: wText(state.error!),
        ): Container();
      },
    );
  }

  @override
  MembershipInformationBloc initBloc() {
    return locator<MembershipInformationBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }



}