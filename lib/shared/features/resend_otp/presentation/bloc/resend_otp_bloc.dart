import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'resend_otp_event.dart';
part 'resend_otp_state.dart';

@injectable
class ResendOTPBloc
    extends BaseBloc<ResendOTPPageEvent, ResendOTPPageState> {

    bool? checked = false;
    ResendOTPBloc(): super(ResendOTPPageInitState()) {

        on<NumberEnteredEvent>((event, emit)=> _onNumberEnteredEvent(event, emit));
    }

    _onNumberEnteredEvent(
        NumberEnteredEvent event,
        Emitter<ResendOTPPageState> emit){

        checked = event.mobileNumber.length == 9;

        emit(NumberEnteredState());
    }
} 
