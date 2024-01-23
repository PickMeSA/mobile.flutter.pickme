import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/register_account_step_1/domain/use_cases/register_account_step_1_usecase/accept_terms_and_conditions_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

part 'register_account_step1_event.dart';
part 'register_account_step1_state.dart';

@injectable
class RegisterAccountStep1Bloc extends BaseBloc<RegisterAccountStep1Event, RegisterAccountStep1State> {
  bool checked = false;
  final AcceptTermsAndConditionsUseCase acceptTermsAndConditionsUseCase;
  RegisterAccountStep1Bloc(
  {required this.acceptTermsAndConditionsUseCase}
      ) : super(RegisterAccountStep1Initial(checked: false)) {
    on<TermsAndConditionsToggledEvent>((event, emit) => _onTermsAndConditionsToggledEvent(event, emit));
    on<RegisterAccountRemoteSubmitStep1Event>((event, emit)=> _onRegisterAccountRemoteSubmitStep1Event(event, emit));
    on<SubmitAcceptedTermsAndConditionsEvent>((event,emit)=> _onSubmitAcceptedTermsAndConditionsEvent(event,emit));
  }

  Future<void> _onSubmitAcceptedTermsAndConditionsEvent(
      SubmitAcceptedTermsAndConditionsEvent event,
      Emitter<RegisterAccountStep1State> emit
      )async{
      emit(SubmitAcceptedTermsAndConditionsState(checked: true)..dataState = DataState.loading);
      try{

        emit(SubmitAcceptedTermsAndConditionsState(checked: true,profileEntity: await acceptTermsAndConditionsUseCase.call())..dataState = DataState.success);

      }catch(ex){
        emit(SubmitAcceptedTermsAndConditionsState(checked: true,error: ex.toString())..dataState = DataState.error);

      }
}
  _onTermsAndConditionsToggledEvent(
      TermsAndConditionsToggledEvent event,
      Emitter<RegisterAccountStep1State> emit
      ) {
    checked = !checked;
    emit(TermsAndConditionsToggledState(checked: checked));
  }

  _onRegisterAccountRemoteSubmitStep1Event(
      RegisterAccountRemoteSubmitStep1Event event,
      Emitter<RegisterAccountStep1State> emit
      )async{

  }
}
