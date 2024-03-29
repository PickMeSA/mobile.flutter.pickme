import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart';

part 'otp_event.dart';
part 'otp_state.dart';

@injectable
class otpBloc extends BaseBloc<otpPageEvent, otpPageState> {
    bool checked = false;
    String? otp;
    bool preloaderActive = false;
    final OTPGetTokenUseCase otpGetTokenUseCase;
    final RegisterOTPCompleteUseCase registerOTPCompleteUseCase;
    final OTPSaveRemoteProfileDataUseCase otpSaveRemoteProfileDataUseCase;
    final GetRemoteProfileUseCase getRemoteProfileUseCase;
    otpBloc({
        required this.getRemoteProfileUseCase,
        required this.registerOTPCompleteUseCase,
        required this.otpGetTokenUseCase,
        required this.otpSaveRemoteProfileDataUseCase
    }): super(otpPageInitState()) {
        on<OTPGetTokenEvent>((event, emit)=> _onOTPGetTokenEvent(event, emit));
        on<RegisterOTPCompleteEvent>((event, emit)=> _onRegisterOTPCompleteEvent(event,emit));
        on<LoginOTPCompleteEvent>((event,emit)=> _onLoginOTPCompleteEvent(event,emit));
        on<OTPEnteredEvent>((event, emit) => _onOTPEnteredEvent(event, emit));
        on<SaveRemoteProfileDataEvent>((event, emit) => _onSaveRemoteProfileDataEvent(event, emit));
        on<GetProfileProgressEvent>((event, emit) => _onGetProfileProgressEvent(event,emit));
    }

    _onGetProfileProgressEvent(
        GetProfileProgressEvent event,
        Emitter<otpPageState> emit) async{
        emit(GetProfileProgressState(userModel: event.userModel)..dataState = DataState.loading);
        try{
        emit(GetProfileProgressState(userModel: event.userModel ,
            profileEntity: await getRemoteProfileUseCase.call())..dataState = DataState.success);
        }catch(ex){
            emit(GetProfileProgressState(userModel: event.userModel,error: ex.toString())..dataState = DataState.error);
        }
    }

    _onSaveRemoteProfileDataEvent(
        SaveRemoteProfileDataEvent event,
        Emitter<otpPageState> emit
        ) async{
        emit(SaveRemoteProfileDataState()..dataState = DataState.loading);
        try{
            await otpSaveRemoteProfileDataUseCase.call(
                params: OTPSaveRemoteProfileDataUseCaseParams(
                    userModel: event.userModel));
            emit(SaveRemoteProfileDataState(error: "", userModel: event.userModel)..dataState = DataState.success);

        }catch(ex){
            emit(SaveRemoteProfileDataState(error: ex.toString()).. dataState = DataState.error);
        }
    }

    _onOTPEnteredEvent(
        OTPEnteredEvent event,
        Emitter<otpPageState> emit
        ) async{
        otp = event.otp;
        if(event.otp.length == 6) {
          checked = true;
          emit(OTPEnteredState());
        }else{
            checked = false;
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
        emit(RegisterOTPCompleteState(profileEntity: event.profileEntity!)..dataState = DataState.loading);

        try{
            await registerOTPCompleteUseCase.call(params: RegisterOTPCompleteUseCaseParams(userModel: event.userEntity!));
            emit(RegisterOTPCompleteState(profileEntity: event.profileEntity!)..dataState = DataState.success);

        }catch(ex){
            emit(RegisterOTPCompleteState(profileEntity: event.profileEntity!)..dataState = DataState.error);
        }

    }

    _onOTPGetTokenEvent(
        OTPGetTokenEvent event,
        Emitter<otpPageState> emit
        )async{
        switch(event.stage){
            case 0 : emit(OTPGetTokenState()..dataState = DataState.loading);
            break;
            case 1 : emit(OTPGetTokenState()..dataState = DataState.success);
            break;
            case -1 : emit(OTPGetTokenState()..dataState = DataState.error);
            break;
            case 2 : emit(OTPGetTokenState()..dataState = DataState.init);
        }

    }
} 
