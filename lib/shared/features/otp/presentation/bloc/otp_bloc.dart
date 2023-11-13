import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart';

part 'otp_event.dart';
part 'otp_state.dart';

@injectable
class otpBloc extends BaseBloc<otpPageEvent, otpPageState> {
    final OTPGetTokenUseCase otpGetTokenUseCase;
    otpBloc({
        required this.otpGetTokenUseCase
    }): super(otpPageInitState()) {
        on<OTPGetTokenEvent>((event, emit)=> _onOTPGetTokenEvent(event, emit));
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
