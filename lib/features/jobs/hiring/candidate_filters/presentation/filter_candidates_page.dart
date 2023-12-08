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
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';

import 'bloc/filter_candidates_bloc.dart';

@RoutePage()
class FilterCandidatesPage extends BasePage {
  const FilterCandidatesPage({super.key, this.serviceCategoryId, });
  final String? serviceCategoryId;

  @override
  State<FilterCandidatesPage> createState() => _FilterCandidatesPage();
}

class _FilterCandidatesPage extends BasePageState<FilterCandidatesPage, FilterCandidatesBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(FilterCandidatesPageEnteredEvent(
      maxDistance: 6,
      priceRange: const RangeValues(0, 20) //Todo: Ask for the default values
    ));
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getLocalization().maxDistance, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontVariations: [
                          const FontVariation("wght", 600)
                        ]
                      ),),
                      AppSlider(currentSliderValue: state.maxDistance,
                        maximumSliderValue: defaultMaxDistance.toDouble(),
                        onChanged: (double newMaxDistance) => getBloc().add(MaxDistanceChangedEvent(maxDistance: newMaxDistance)),),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            color: neutrals100Color,
                            child: Text("${state.maxDistance.toStringAsFixed(2)}km",)),),
                      24.height,
                      Text(getLocalization().possiblePriceRange, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontVariations: [
                          const FontVariation("wght", 600)
                        ]
                      ),),
                      AppRangeSlider(
                        rangeValues: state.priceRange,
                        minimumSliderValue: 0,
                        maximumSliderValue: defaultMaxPrice.toDouble(),
                        onChanged: (RangeValues priceRange) => getBloc().add(PriceRangeChangedEvent(priceRange: priceRange))
                        ,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            color: neutrals100Color,
                            child: Text("R${state.priceRange.start.toStringAsFixed(2)}",)), //todo: Confirm precision
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            color: neutrals100Color,
                            child: Text("${state.priceRange.end.toStringAsFixed(2)}",))
                      ],
                    ),
                      48.height,
                      Text(getLocalization().candidateRating, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontVariations: [
                            const FontVariation("wght", 600)
                          ]
                      ),),
                      20.height,
                      AppStarRating()
                    ],
                  ),
                ),
              ),
              20.height,
              Row(
                children: [
                  Expanded(
                    child: SecondaryButtonDark(
                      onPressed: (){},
                      child: Text(
                        getLocalization().reset
                      ),),
                  ),
                  10.width,
                  Expanded(
                    child: PrimaryButtonDark(
                      onPressed: (){},
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