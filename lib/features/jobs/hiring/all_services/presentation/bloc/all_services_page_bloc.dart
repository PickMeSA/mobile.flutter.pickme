import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'all_services_page_event.dart';
part 'all_services_page_state.dart';

@injectable
class AllServicesPageBloc extends BaseBloc<AllServicesPageEvent, AllServicesPageState> {
  AllServicesPageBloc() : super(AllServicesPageInitial()) {
    on<SeeAllClickedEvent>((event, emit) => _onSeeAllClickedEventEvent(event, emit));
  }
  _onSeeAllClickedEventEvent(
      SeeAllClickedEvent event,
      Emitter<AllServicesPageState> emit
      ) {
  // go to all page
  }
}
