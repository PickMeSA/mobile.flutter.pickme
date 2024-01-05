import 'dart:ui';

import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
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
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

import 'bloc/create_job_listing_info_bloc.dart';

@RoutePage()
class CreateJobListingInfoPage extends BasePage {
  const CreateJobListingInfoPage({super.key});


  @override
  State<CreateJobListingInfoPage> createState() => _MyJobListingsPageState();
}

class _MyJobListingsPageState extends BasePageState<CreateJobListingInfoPage, CreateJobListingInfoBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(CreateJobListingInfoPageEnteredEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<CreateJobListingInfoBloc, CreateJobListingState>(
      listener: (context, state) {
        //loading
        if(state is CreateJobListingInfoPageEnteredState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }

        //loading
        if(state is CreateJobListingInfoPageEnteredState && state.dataState == DataState.success){
          Navigator.pop(context); //Remove loader
        }          //loading
        if(state is CreateJobListingInfoPageEnteredState && state.dataState == DataState.error){
          Navigator.pop(context); //Remove loader
          //   todo: Display error
        }
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(state.dataState == DataState.loading) const Center(
                child: Text("Loading..."),
              ),
              if(getBloc().pageInfo!=null)
                Text(getBloc().pageInfo!.description),
              if(getBloc().pageInfo!=null) 16.height,
              if(getBloc().pageInfo!=null)
                Expanded(child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: getBloc().pageInfo!.information.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Row(
                        children: [
                          const Icon(Iconsax.tick_square), 16.width,
                          Expanded(
                              child: Text(
                                getBloc().pageInfo!.information[index].title,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              )
                          )
                        ],
                      ),
                      subtitle: Text(
                          getBloc().pageInfo!.information[index].description
                      ),
                    );
                  },

                )),
              if(state.dataState==DataState.success)
                PrimaryButton.fullWidth(onPressed: (){
                  context.router.push(CreateJobListingRoute());
                }, child: Text(getLocalization().acceptAndContinue))
            ],
          ),
        );
      },
    );
  }

  @override
  CreateJobListingInfoBloc initBloc() {
    return locator<CreateJobListingInfoBloc>();
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