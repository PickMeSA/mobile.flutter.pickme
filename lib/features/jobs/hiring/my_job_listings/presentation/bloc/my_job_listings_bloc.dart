import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';

import '../../../../../../shared/domain/entities/my_job_listings_page_entity.dart';
import '../../../../../../shared/domain/usecases/get_my_job_listings_usecase.dart';
part 'my_job_listings_event.dart';
part 'my_job_listings_state.dart';

@injectable
class MyJobListingsBloc extends BaseBloc<MyJobListingsEvent, MyJobListingsState> {
  final GetMyJobListingsUseCase getMyJobListingsUseCase;
  MyJobListingsPageEntity? myJobs;
  int selectedTabIndex = 0;
  Logger logger = Logger();
  bool preloaderActive = false;

  MyJobListingsBloc({required this.getMyJobListingsUseCase}) : super(MyJobListingsPageInitial()) {
    on<MyJobListingsPageEnteredEvent>((event, emit) => _onMyJobListingsPageEnteredEvent(event, emit));
    on<SelectedTabChangedEvent>((event, emit) => _onSelectedTabChangedEvent(event, emit));
  }

  _onSelectedTabChangedEvent(
      SelectedTabChangedEvent event,
      Emitter<MyJobListingsState> emit
      ) {
    selectedTabIndex = event.tabIndex;
    emit(SelectedTabChangedState());
  }

  _onMyJobListingsPageEnteredEvent(
      MyJobListingsPageEnteredEvent event,
      Emitter<MyJobListingsState> emit
      )async{
    emit(MyJobListingsPageEnteredState()..dataState=DataState.loading);
    try{
      if(event.jobListingsPageEntity!=null){
        myJobs = event.jobListingsPageEntity;
        emit(MyJobListingsPageEnteredState()..dataState=DataState.loading);
      }
        myJobs = await getMyJobListingsUseCase.call();

      emit(MyJobListingsPageEnteredState()..dataState=DataState.success);
    }catch(ex){
      emit(MyJobListingsPageEnteredState(error: ex.toString())..dataState=DataState.error);
      logger.e(ex);
    }
  }
}
