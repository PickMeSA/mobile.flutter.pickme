part of 'pay_someone_web_view_bloc.dart';
@immutable
abstract class PaySomeoneWebViewPageState extends BaseState {
  String? error;

  PaySomeoneWebViewPageState({this.error});
}

class PaySomeoneWebViewPageInitState extends PaySomeoneWebViewPageState  {}

class MakePaymentState extends PaySomeoneWebViewPageState{
  String? url;

  MakePaymentState({this.url, super.error});
}