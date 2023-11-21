import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart';

part 'otp_event.dart';
part 'otp_state.dart';

@injectable
class otpBloc extends BaseBloc<otpPageEvent, otpPageState> {
    bool checked = false;
    String? otp;
    final OTPGetTokenUseCase otpGetTokenUseCase;
    final RegisterOTPCompleteUseCase registerOTPCompleteUseCase;
    otpBloc({
        required this.registerOTPCompleteUseCase,
        required this.otpGetTokenUseCase
    }): super(otpPageInitState()) {
        on<OTPGetTokenEvent>((event, emit)=> _onOTPGetTokenEvent(event, emit));
        on<RegisterOTPCompleteEvent>((event, emit)=> _onRegisterOTPCompleteEvent(event,emit));
        on<LoginOTPCompleteEvent>((event,emit)=> _onLoginOTPCompleteEvent(event,emit));
        on<OTPEnteredEvent>((event, emit) => _onOTPEnteredEvent(event, emit));
    }

    _onOTPEnteredEvent(
        OTPEnteredEvent event,
        Emitter<otpPageState> emit
        ) async{
        otp = event.otp;
        if(event.otp.length == 6) {
          checked = true;
          emit(OTPEnteredState());
        }

    }



    _onLoginOTPCompleteEvent(
        LoginOTPCompleteEvent event,
        Emitter<otpPageState> emit
        )async{
        try{
        }catch(ex){

        }
    }

    _onRegisterOTPCompleteEvent(
        RegisterOTPCompleteEvent event,
        Emitter<otpPageState> emit
        ) async{
        emit(RegisterOTPCompleteState()..dataState = DataState.loading);

        try{
            await registerOTPCompleteUseCase.call(params: RegisterOTPCompleteUseCaseParams(userModel: event.userModel!));
            emit(RegisterOTPCompleteState()..dataState = DataState.success);

        }catch(ex){
            emit(RegisterOTPCompleteState()..dataState = DataState.error);
        }

    }

    _onOTPGetTokenEvent(
        OTPGetTokenEvent event,
        Emitter<otpPageState> emit
        )async{
        emit(OTPGetTokenState()..dataState = DataState.loading);
        try{
            emit(OTPGetTokenState(
                tokenModel: await otpGetTokenUseCase.call(
                    params: OTPGetTokenUseCaseParams(
                        smsCode: event.smsCode,
                        verificationID: event.verificationId)))..dataState = DataState.success);
        }catch(ex){
            emit(OTPGetTokenState()..dataState = DataState.error);
        }
    }
} 
