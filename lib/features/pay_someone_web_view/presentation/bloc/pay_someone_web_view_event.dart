part of 'pay_someone_web_view_bloc.dart';
 @immutable
abstract class PaySomeoneWebViewPageEvent extends BaseEvent {}

class MakePaymentEvent extends PaySomeoneWebViewPageEvent{

  BookingEntity? bookingEntity;

  MakePaymentEvent({this.bookingEntity});
}