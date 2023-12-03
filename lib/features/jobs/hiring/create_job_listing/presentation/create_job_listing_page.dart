import 'dart:ui';

import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';

import 'bloc/create_job_listing_bloc.dart';

@RoutePage()
class CreateJobListingPage extends BasePage {
  const CreateJobListingPage({super.key});


  @override
  State<CreateJobListingPage> createState() => _MyJobListingsPageState();
}

class _MyJobListingsPageState extends BasePageState<CreateJobListingPage, CreateJobListingBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(CreateJobListingPageEnteredEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<CreateJobListingBloc, CreateJobListingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        PaginatedIndustryEntity? industries = state.paginatedIndustries;

        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(getLocalization().jobListingDetails, style: theme.textTheme.bodyMedium!.copyWith(
                  fontVariations: [
                    const FontVariation("wght", 600)
                  ]
              ),),
              24.height,
              Expanded(child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppTextFormField(
                        textFieldType: TextFieldType.OTHER,
                        labelText: "${getLocalization().jobName} *",
                      ),
                      16.height,
                      AppTextFormField(
                        textFieldType: TextFieldType.MULTILINE,
                        labelText: "${getLocalization().jobDescription} *",
                        hint: getLocalization().loremIpsumDescriptionField,
                      ),
                    ],
                  ),
                ),
              ))

            ],
          ),
        );
      },
    );
  }

  @override
  CreateJobListingBloc initBloc() {
    return locator<CreateJobListingBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().createAJobListing,),
    );
  }

}