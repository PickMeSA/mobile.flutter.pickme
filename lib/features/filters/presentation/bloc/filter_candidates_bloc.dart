import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';

part 'filter_candidates_event.dart';
part 'filter_candidates_state.dart';

@injectable
class FilterCandidatesBloc extends BaseBloc<FilterCandidatesEvent, FilterCandidatesState> {
  //ToDo: Confirm defaults here
  FilterEntity? filter;
  final FilterEntity defaultFilter = FilterEntity(
      distance: defaultDistance.toDouble(),
      priceRange: defaultPriceRange,
      estimatedHours: defaultEstimatedHours.toDouble(),
      rating: defaultRating
  );
  // double maxDistance = defaultDistance.toDouble();
  // RangeValues priceRange = defaultPriceRange;
  Logger logger = Logger();

  FilterCandidatesBloc() : super(FilterCandidatesInitial()) {
    on<FilterCandidatesPageEnteredEvent>((event, emit) => _onFilterCandidatesPageEnteredEvent(event, emit));
    on<MaxDistanceChangedEvent>((event, emit) => _onMaxDistanceChangedEvent(event, emit));
    on<PriceRangeChangedEvent>((event, emit) => _onPriceRangeChangedEvent(event, emit));
    on<EstimatedHoursChangedEvent>((event, emit) => _onEstimatedHoursChangedEvent(event, emit));
    on<RatingChangedEvent>((event, emit) => _onRatingChangedEvent(event, emit));
    on<ResetClickedEvent>((event, emit) => _onResetClickedEvent(event, emit));
  }

  _onFilterCandidatesPageEnteredEvent(
      FilterCandidatesPageEnteredEvent event,
      Emitter<FilterCandidatesState> emit
      )async{
    if(event.filterEntity==null){
      filter = defaultFilter;
      emit(FilterCandidatesPageEnteredState()..dataState = DataState.success);
    }
  }
  _onMaxDistanceChangedEvent(
      MaxDistanceChangedEvent event,
      Emitter<FilterCandidatesState> emit
      )async {
    filter = filter!.copyWith(distance_: event.maxDistance);
    emit(MaxDistanceChangedState()..dataState = DataState.loading);
  }
    _onPriceRangeChangedEvent(
        PriceRangeChangedEvent event,
      Emitter<FilterCandidatesState> emit
      )async{

      filter = filter!.copyWith(priceRange_: event.priceRange);
      emit(MaxDistanceChangedState()..dataState = DataState.loading);
    emit(PriceRangeChangedState()..dataState = DataState.loading);
  }
    _onEstimatedHoursChangedEvent(
        EstimatedHoursChangedEvent event,
      Emitter<FilterCandidatesState> emit
      )async{

      filter = filter!.copyWith(estimatedHours_: event.estimatedHours);
      emit(MaxDistanceChangedState()..dataState = DataState.loading);
    emit(PriceRangeChangedState()..dataState = DataState.loading);
  }
    _onRatingChangedEvent(
        RatingChangedEvent event,
      Emitter<FilterCandidatesState> emit
      )async{

      filter = filter!.copyWith(rating_: event.rating);
      emit(MaxDistanceChangedState()..dataState = DataState.loading);
    emit(PriceRangeChangedState()..dataState = DataState.loading);
  }
    _onResetClickedEvent(
        ResetClickedEvent event,
      Emitter<FilterCandidatesState> emit
      )async{

      filter = defaultFilter;
      emit(MaxDistanceChangedState()..dataState = DataState.loading);
    emit(PriceRangeChangedState()..dataState = DataState.loading);
  }
}
