import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/hiring/all_services/presentation/bloc/all_services_page_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'package:pickme/shared/widgets/w_page_padding.dart';

@RoutePage()
class AllServicesPage extends BasePage {
  const AllServicesPage({super.key});


  @override
  State<AllServicesPage> createState() => _AllServicesPageState();
}

class _AllServicesPageState extends BasePageState<AllServicesPage, AllServicesPageBloc> {
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<AllServicesPageBloc, AllServicesPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                textFieldType: TextFieldType.OTHER,
                bgColor: neutrals100Color,
                borderColor: whiteColor,
                prefixIcon: const Icon(Iconsax.search_normal_1),
                hint: getLocalization().whatAreYouLookingFor,
              ),
              10.height,
              AppTextField(
                textFieldType: TextFieldType.OTHER,
                bgColor: neutrals100Color,
                borderColor: whiteColor,
                prefixIcon: const Icon(Iconsax.location),
                hint: getLocalization().locationAreaBasedOnProfile,
              ),
              20.height,
              Text(getLocalization().browseCategories,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontVariations: [const FontVariation('wght', 600)]),),
              10.height,
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Service Category"),
                      trailing: Icon(Iconsax.arrow_right_3),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return AppDivider();
                  }, itemCount: 3,
                ),
              )

            ],
          ),
        );
      },
    );
  }

  @override
  AllServicesPageBloc initBloc() {
    return locator<AllServicesPageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().allServices),
      actions: [
        TextButton(onPressed: (){}, child: Icon(Iconsax.candle_2, color: Theme.of(context).colorScheme.secondary,))
      ],
    );
  }


}