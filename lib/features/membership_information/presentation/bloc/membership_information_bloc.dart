import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'membership_information_event.dart';
part 'membership_information_state.dart';

@injectable
class MembershipInformationBloc extends BaseBloc<TermsAndConditionsEvent, MembershipInformationState> {
  MembershipInformationBloc() : super(LandingInitial()) {
    on<TermsAndConditionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
