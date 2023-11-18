import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart';


part 'login_event.dart';
part 'login_state.dart';
@injectable
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {

  LoginContinueClickedUseCase loginContinueClickedUsecase;
  LoginBloc({
    required this.loginContinueClickedUsecase
  }) : super(LoginInitial(checked: false)) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginContinueClickedEvent>((event, emit)=> _onLoginContinueClickedEvent(event, emit));
    on<NumberChangedEvent>((event, emit) => _onNumberChangedEvent(event,emit));
  }

  _onNumberChangedEvent(
      NumberChangedEvent event,
      Emitter<LoginState> emit
      )async{

      if(event.mobileNumber.length == 9) {
        emit(NumberChangedState(checked: true));
      }


  }

  _onLoginContinueClickedEvent(
      LoginContinueClickedEvent event,
      Emitter<LoginState> emit
      )async{
    emit(LoginContinueClickedState(checked: true)..dataState = DataState.loading);

    try{
      loginContinueClickedUsecase.callBack(
        mobileNumber: "+27${event!.mobileNumber}",
        onError: (error){
          //emit(LoginContinueClickedState(checked: false)..dataState = DataState.error);
        },
        onSuccesss:(verificationId, resentCode){
          emit(LoginContinueClickedState(checked: true)..dataState = DataState.success);
        }
      );
    }catch(ex){
      emit(LoginContinueClickedState(checked: false)..dataState = DataState.error);
    }
  }
}
