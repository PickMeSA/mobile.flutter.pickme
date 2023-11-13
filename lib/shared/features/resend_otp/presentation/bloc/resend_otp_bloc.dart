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
    ResendOTPBloc(): super(ResendOTPPageInitState()) {}
} 
