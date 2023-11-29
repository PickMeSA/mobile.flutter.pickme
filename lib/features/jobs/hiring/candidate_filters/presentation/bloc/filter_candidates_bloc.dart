import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';

part 'filter_candidates_event.dart';
part 'filter_candidates_state.dart';

@injectable
class FilterCandidatesBloc extends BaseBloc<FilterCandidatesEvent, FilterCandidatesState> {
  //ToDo: Confirm defaults here
  double maxDistance = defaultDistance.toDouble();
  RangeValues priceRange = defaultPriceRange;
  Logger logger = Logger();

  FilterCandidatesBloc() : super(FilterCandidatesInitial(
      maxDistance: defaultDistance.toDouble(),
      priceRange: defaultPriceRange,
  )) {
    on<FilterCandidatesPageEnteredEvent>((event, emit) =>
        _onFilterCandidatesPageEnteredEvent(event, emit));
    on<MaxDistanceChangedEvent>((event, emit) =>
        _onMaxDistanceChangedEvent(event, emit));
    on<PriceRangeChangedEvent>((event, emit) =>
        _onPriceRangeChangedEvent(event, emit));
  }

  _onFilterCandidatesPageEnteredEvent(
      FilterCandidatesPageEnteredEvent event,
      Emitter<FilterCandidatesState> emit
      )async{
    // emit(FilterCandidatesInitial(maxDistance: 4)..dataState = DataState.loading);
  }
  _onMaxDistanceChangedEvent(
      MaxDistanceChangedEvent event,
      Emitter<FilterCandidatesState> emit
      )async {
    maxDistance = event.maxDistance;

    emit(MaxDistanceChangedState(
        maxDistance: event.maxDistance,
        priceRange: priceRange
    )
      ..dataState = DataState.loading);
  }
    _onPriceRangeChangedEvent(
        PriceRangeChangedEvent event,
      Emitter<FilterCandidatesState> emit
      )async{
      priceRange = event.priceRange;
    emit(PriceRangeChangedState(
        maxDistance: maxDistance,
      priceRange: event.priceRange
    )..dataState = DataState.loading);
  }
}
