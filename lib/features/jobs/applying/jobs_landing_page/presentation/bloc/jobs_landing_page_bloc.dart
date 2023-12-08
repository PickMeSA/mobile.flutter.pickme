import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'jobs_landing_page_event.dart';
part 'jobs_landing_page_state.dart';

@injectable
class JobsLandingPageBloc extends BaseBloc<JobsLandingPageEvent, JobsLandingPageState> {
  JobsLandingPageBloc() : super(JobsLandingPageInitial()) {
    on<SeeAllClickedEvent>((event, emit) => _onSeeAllClickedEventEvent(event, emit));
  }
  _onSeeAllClickedEventEvent(
      SeeAllClickedEvent event,
      Emitter<JobsLandingPageState> emit
      ) {
  // go to all page
  }
}
