import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'pending_profile_event.dart';
part 'pending_profile_state.dart';

@injectable
class PendingProfileBloc extends BaseBloc<PendingProfileEvent, PendingProfileState> {
  PendingProfileBloc() : super(LandingInitial()) {
    on<PendingProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
