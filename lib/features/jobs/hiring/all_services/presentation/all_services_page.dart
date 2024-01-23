import 'dart:ui';

import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/applying/job_list_page/presentation/job_list_page.dart';
import 'package:pickme/features/jobs/hiring/all_services/presentation/bloc/all_services_page_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/classes/debouncer.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';

import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
enum ServicesPageMode{ hiring, working}
@RoutePage()
class AllServicesPage extends BasePage {
  const AllServicesPage({super.key, this.pageMode = ServicesPageMode.hiring});
  final ServicesPageMode pageMode;

  @override
  State<AllServicesPage> createState() => _AllServicesPageState();
}

class _AllServicesPageState extends BasePageState<AllServicesPage, AllServicesPageBloc> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    getBloc().add(AllServicesPageEnteredEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<AllServicesPageBloc, AllServicesPageState>(
      listener: (context, state) {
        //loading GetIndustriesState
        if(state is GetIndustriesState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading SearchTextChangedState
        if(state is SearchTextChangedState && state.dataState == DataState.loading){
          debugPrint(getBloc().preloaderActive.toString());
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is GetIndustriesState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
        }
        //loading
        if(state is SearchTextChangedState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
        }
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
                onChanged: (String searchText) => {
                 _debouncer.run(() => getBloc().add(SearchTextChangedEvent(searchText: searchText)))
                },
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
              if(getBloc().paginatedIndustries!=null)Expanded(
                child: ListView.separated(
                  itemCount: getBloc().paginatedIndustries!.industries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(getBloc().paginatedIndustries!.industries[index].industry!),
                      trailing: const Icon(Iconsax.arrow_right_3),
                      onTap: (){
                        if(widget.pageMode == ServicesPageMode.hiring){
                          context.router.push(ServiceCategoryCandidatesRoute(serviceCategoryId: getBloc().paginatedIndustries!.industries[index].id.toString()));
                        }else{
                          context.router.push(JobListRoute(pageMode: JobListMode.categoryJobs, pageTitle: getBloc().paginatedIndustries!.industries[index].industry, categoryId: getBloc().paginatedIndustries!.industries[3].id.toString()));
                        }
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const AppDivider();
                  },
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
        TextButton(onPressed: () async{
          FilterEntity? filter = await context.router.push(FiltersRoute());
          if(filter!=null){
            getBloc().add(FilterChangedEvent(filterEntity: filter));
          }
        }, child: Icon(Iconsax.candle_2, color: Theme.of(context).colorScheme.secondary,))
      ],
    );
  }


}