import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'landing_event.dart';
part 'landing_state.dart';

@injectable
class LandingBloc extends BaseBloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingInitial()) {
    on<LandingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
