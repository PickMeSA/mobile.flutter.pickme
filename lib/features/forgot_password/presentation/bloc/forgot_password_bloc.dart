import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

@injectable
class ForgotPasswordBloc
    extends BaseBloc<ForgotPasswordPageEvent, ForgotPasswordPageState> {
    bool checked = false;
    ForgotPasswordBloc(): super(ForgotPasswordPageInitState()) {
        on<EmailChangedEvent>((event, emit)=> _onEmailChangedEvent(event, emit));
        on<ResetEmailButtonClickedEvent>((event,emit)=> _onResetEmailButtonClickedEvent(event, emit));
    }

    _onEmailChangedEvent(
        EmailChangedEvent event,
        Emitter<ForgotPasswordPageState> emit
        ){
        if(event.emailAddress.isNotEmpty){
            checked = true;
            emit(EmailChangedState());
        }

    }

    _onResetEmailButtonClickedEvent(
        ResetEmailButtonClickedEvent event,
        Emitter<ForgotPasswordPageState> emit
        ){

        switch(event.index){
            case 0 : emit(ResetEmailButtonClickedState()..dataState = DataState.loading);
            break;
            case 1 : emit(ResetEmailButtonClickedState()..dataState = DataState.success);
            break;
            case 2 : emit(ResetEmailButtonClickedState()..dataState = DataState.error);
            break;
        }
    }


} 
