import 'dart:async';

import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/features/register/domain/entities/user/user.dart';
import 'package:pickme/features/register/domain/usecase/continue_clicked_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';


part 'register__event.dart';
part 'register__state.dart';

@injectable
class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {

  final ContinueClickedUseCase continueClickedUseCase;


  RegisterBloc({
    required this.continueClickedUseCase
  }) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ContinueClickedEvent>((event, emit)=> _onContinueClickedEvent(event, emit));
  }


  _onContinueClickedEvent(
      ContinueClickedEvent event,
      Emitter<RegisterState> emit
      )async {
        await continueClickedUseCase(params: ContinueClickedUseCaseParams(user: event.user));
      }

}
