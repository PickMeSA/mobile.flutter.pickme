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
    ForgotPasswordBloc(): super(ForgotPasswordPageInitState()) {}
} 
