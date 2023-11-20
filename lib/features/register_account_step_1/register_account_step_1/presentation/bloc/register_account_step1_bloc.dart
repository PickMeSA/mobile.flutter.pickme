import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'register_account_step1_event.dart';
part 'register_account_step1_state.dart';

@injectable
class RegisterAccountStep1Bloc extends BaseBloc<RegisterAccountStep1Event, RegisterAccountStep1State> {
  bool checked = false;
  RegisterAccountStep1Bloc() : super(RegisterAccountStep1Initial(checked: false)) {
    on<TermsAndConditionsToggledEvent>((event, emit) => _onTermsAndConditionsToggledEvent(event, emit));
  }
  _onTermsAndConditionsToggledEvent(
      TermsAndConditionsToggledEvent event,
      Emitter<RegisterAccountStep1State> emit
      ) {
    checked = !checked;
    emit(TermsAndConditionsToggledState(checked: checked));
  }
}
