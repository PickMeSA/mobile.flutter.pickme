import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/otp_get_credential_usecase.dart';

part 'otp_event.dart';
part 'otp_state.dart';

@injectable
class otpBloc extends BaseBloc<otpPageEvent, otpPageState> {
    final OTPGetCredentialUseCase otpGetCredentialUseCase;
    otpBloc({
        required this.otpGetCredentialUseCase
    }): super(otpPageInitState()) {
        on<OTPGetCredentialsEvent>((event, emit)=> _onOTPGetCredentialEvent(event, emit));
    }

    _onOTPGetCredentialEvent(
        OTPGetCredentialsEvent event,
        Emitter<otpPageState> emit
        )async{
        emit(OTPGetCredentialsState()..dataState = DataState.loading);
        try{
            emit(OTPGetCredentialsState(
                userCredential: await otpGetCredentialUseCase.call(
                    params: OTPGetCredentialUseCaseParams(
                        smsCode: event.smsCode,
                        verificationID: event.verificationId)))..dataState = DataState.success);
        }catch(ex){
            emit(OTPGetCredentialsState()..dataState = DataState.error);
        }
    }
} 
