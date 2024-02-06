part of 'forgot_password_bloc.dart';
 @immutable
abstract class ForgotPasswordPageEvent extends BaseEvent {}

class EmailChangedEvent extends ForgotPasswordPageEvent{
 String emailAddress;

 EmailChangedEvent({required this.emailAddress});
}

class ResetEmailButtonClickedEvent extends ForgotPasswordPageEvent{
  int?  index ;

  ResetEmailButtonClickedEvent({required this.index});
}