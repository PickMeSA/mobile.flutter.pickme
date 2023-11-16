import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'terms_and_conditions_event.dart';
part 'terms_and_conditions_state.dart';

@injectable
class TermsAndConditionsBloc extends BaseBloc<TermsAndConditionsEvent, TermsAndConditionsState> {
  TermsAndConditionsBloc() : super(LandingInitial()) {
    on<TermsAndConditionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
