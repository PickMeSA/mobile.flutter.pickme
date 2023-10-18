import 'dart:async';

import 'package:app/bases/bloc_base_classes/base_bloc.dart';
import 'package:app/bases/bloc_base_classes/base_event.dart';
import 'package:app/bases/bloc_base_classes/base_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SelectLoginEvent>((event, emit)=> _onSelectLoginEvent(event, emit));
  }

  _onSelectLoginEvent(
      SelectLoginEvent event,
      Emitter<LoginState> emit)async{
    emit(SelectLoginState(approvalMessage: "")..dataState = DataState.loading);

    // authentication function

    //if success full

    emit(SelectLoginState(approvalMessage: "approved")..dataState = DataState.success);
  }
}
