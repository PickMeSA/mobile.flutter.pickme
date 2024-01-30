import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:pickme/shared/domain/usecases/send_job_offer_use_case.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';

part 'job_offers_list_page_event.dart';
part 'job_offers_list_page_state.dart';

@injectable
class JobOffersListBloc extends BaseBloc<JobOffersListPageEvent, JobOffersListPageState> {
  Logger logger = Logger();
  bool preloaderActive = false;
  JobEntity? selectedJob;
  FilterEntity filterEntity = FilterEntity();

  JobOffersListBloc() : super(MyJobListingsPageInitial()) {
    on<MyJobListingsPageEnteredEvent>((event, emit) =>
        _onMyJobListingsPageEnteredEvent(event, emit));
    on<JobSelectedEvent>((event, emit) => _onJobSelectedEvent(event, emit));
  }
  _onJobSelectedEvent(
      JobSelectedEvent event,
      Emitter<JobOffersListPageState> emit
      ) {
    selectedJob = event.job;
    emit(SelectedJobChangedState());
  }


  _onMyJobListingsPageEnteredEvent(
      MyJobListingsPageEnteredEvent event,
      Emitter<JobOffersListPageState> emit
      )async{


  }

}
