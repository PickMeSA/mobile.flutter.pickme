import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/enums/app_mode_enum.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';

import 'bloc/filter_candidates_bloc.dart';

@RoutePage<FilterEntity>()
class FiltersPage extends BasePage {
  const FiltersPage({super.key, this.serviceCategoryId, this.filterEntity, this.appMode=AppMode.working});
  final String? serviceCategoryId;
  final FilterEntity? filterEntity;
  final AppMode appMode;

  @override
  State<FiltersPage> createState() => _FilterCandidatesPage();
}

class _FilterCandidatesPage extends BasePageState<FiltersPage, FilterCandidatesBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(FilterCandidatesPageEnteredEvent(filterEntity: widget.filterEntity));
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<FilterCandidatesBloc, FilterCandidatesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: Column(
            children: [
             if(getBloc().filter!=null) Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getLocalization().maxDistance, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontVariations: [
                          const FontVariation("wght", 600)
                        ]
                      ),),
                      AppSlider(currentSliderValue: getBloc().filter!.distance!,
                        divisions: defaultMaxDistance,
                        maximumSliderValue: defaultMaxDistance.toDouble(),
                        onChanged: (double newMaxDistance) => getBloc().add(MaxDistanceChangedEvent(maxDistance: newMaxDistance)),),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            color: neutrals100Color,
                            child: Text("${getBloc().filter!.distance!.toStringAsFixed(0)} km",)),),
                      24.height,
                      if(widget.appMode == AppMode.working)Text(getLocalization().estHours, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontVariations: [
                            const FontVariation("wght", 600)
                          ]
                      ),),
                      if(widget.appMode == AppMode.working)AppSlider(
                        currentSliderValue: getBloc().filter!.estimatedHours!,
                        minimumSliderValue: 0,
                        maximumSliderValue: defaultEstimatedHours.toDouble(),
                        divisions: defaultEstimatedHours,
                        onChanged: (double newValue) => getBloc().add(EstimatedHoursChangedEvent(estimatedHours: newValue))
                        ,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            color: neutrals100Color,
                            child: Text("${getBloc().filter!.estimatedHours!.toInt()} hours",)),),
                      24.height,                      Text(getLocalization().possiblePriceRange, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontVariations: [
                          const FontVariation("wght", 600)
                        ]
                      ),),
                      AppRangeSlider(
                        rangeValues: getBloc().filter!.priceRange!,
                        minimumSliderValue: 0,
                        maximumSliderValue: defaultMaxPrice.toDouble(),
                        onChanged: (RangeValues priceRange) => getBloc().add(PriceRangeChangedEvent(priceRange: priceRange))
                        ,),24.height,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            color: neutrals100Color,
                            child: Text("R${getBloc().filter!.priceRange!.start.toStringAsFixed(2)}",)), //todo: Confirm precision
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            color: neutrals100Color,
                            child: Text(getBloc().filter!.priceRange!.end.toStringAsFixed(2),))
                      ],
                    ),
                      48.height,
                      Text(getLocalization().candidateRating, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontVariations: [
                            const FontVariation("wght", 600)
                          ]
                      ),),
                      20.height,
                      if(widget.appMode == AppMode.hiring)AppStarRating(
                        rating: getBloc().filter!.rating!,
                        onChanged: (int newRating)=>getBloc().add(RatingChangedEvent(rating: newRating)),
                      ),
                    ],
                  ),
                ),
              ),
              20.height,
              Row(
                children: [
                  Expanded(
                    child: SecondaryButtonDark(
                      onPressed: ()=>getBloc().add(ResetClickedEvent()),
                      child: Text(
                        getLocalization().reset
                      ),),
                  ),
                  10.width,
                  Expanded(
                    child: PrimaryButtonDark(
                      onPressed: ()=> Navigator.pop(context,
                        getBloc().filter!,
                      ),
                      child: Text(
                        getLocalization().applyFilters
                      ),),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  FilterCandidatesBloc initBloc() {
    return locator<FilterCandidatesBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      leading: Icon(Iconsax.candle_2, color: Theme.of(context).colorScheme.secondary,),
      title: Text(getLocalization().filters,),
      actions: [
        TextButton(onPressed: ()=>Navigator.pop(context), child: Icon(Icons.close, color: Theme.of(context).colorScheme.secondary,))
      ],
    );
  }

}