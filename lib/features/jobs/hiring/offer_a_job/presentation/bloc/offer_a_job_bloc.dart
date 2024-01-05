import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';

part 'offer_a_job_event.dart';
part 'offer_a_job_state.dart';

@injectable
class OfferAJobBloc extends BaseBloc<OfferAJobEvent, OfferAJobState> {
  bool preloaderActive = false;
  Logger logger = Logger();
  String? selectedOfferType;

  OfferAJobBloc() : super(MyJobListingsPageInitial()) {
    on<SelectedOfferTypeChangedEvent>((event, emit) => _onSelectedOfferTypeChangedEvent(event, emit));
  }

  _onSelectedOfferTypeChangedEvent(
      SelectedOfferTypeChangedEvent event,
      Emitter<OfferAJobState> emit
      )async{
    try{
      selectedOfferType = event.offerType;
      emit(SelectedOfferTypeChangedState()..dataState=DataState.success);
    }catch(ex){
      emit(SelectedOfferTypeChangedState()..dataState=DataState.error);
    }

  }
}
