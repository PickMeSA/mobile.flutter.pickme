import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart';


part 'login_event.dart';
part 'login_state.dart';
@injectable
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  final GetRemoteProfileUseCase getRemoteProfileUseCase;

  bool preloader = false;
  bool checked = false;
  LoginBloc({
    required this.getRemoteProfileUseCase
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

      if(event.email.isNotEmpty && event.password.isNotEmpty) {
        this.checked = true;

      }else{
        this.checked = false;
      }
      emit(NumberChangedState());

  }

  _onLoginContinueClickedEvent(
      LoginContinueClickedEvent event,
      Emitter<LoginState> emit
      )async{
    emit(LoginContinueClickedState()..dataState = DataState.loading);

    try{
      emit(LoginContinueClickedState(profileEntity:  await getRemoteProfileUseCase.call())..dataState = DataState.success);
    }catch(ex){
      emit(LoginContinueClickedState(error: ex.toString())..dataState = DataState.error);
    }

  }
}
