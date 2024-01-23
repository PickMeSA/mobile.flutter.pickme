import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';


part 'register__event.dart';
part 'register__state.dart';

@injectable
class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  bool preloader = false;
  bool checked = false;
  int index = 0;


  //final ContinueClickedUseCase continueClickedUseCase;
  int identificationType = 1;
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SubmitClickedEvent>((event, emit)=> _onContinueClickedEvent(event, emit));
    on<ValueChangedEvent>((event, emit) => _onValueChangedEvent(event, emit));
    on<IdentificationChangedEvent>((event, emit)=> _onIdentificationChangedEvent(event, emit));
  }

  _onIdentificationChangedEvent(
      IdentificationChangedEvent event,
      Emitter<RegisterState> emit){
    index = event.index;
    emit(IdentificationChangedState());
  }

  _onValueChangedEvent(
      ValueChangedEvent event,
      Emitter<RegisterState> emit
      ) async{
    checked = false;
      if(
          event.userModel.firstName!.isNotEmpty&&
          event.userModel.surname!.isNotEmpty&&
          event.userModel.email!.isNotEmpty
      ){
        if(index == 0){
          if(event.userModel.idNumber!.isNotEmpty && event.userModel.idNumber!.length == 13){
            checked = true;
          }
        }else if(event.userModel.passportNumber!.isNotEmpty &&
        event.userModel.workPermitNumber!.isNotEmpty){
          checked = true;
        }

        emit(ValueChangedState());
      }
  }


  _onContinueClickedEvent(
      SubmitClickedEvent event,
      Emitter<RegisterState> emit
      )async {
    emit(ContinueClickedState()..dataState = DataState.loading);

      }



}
