part of 'propose_alternative_bloc.dart';
 @immutable
abstract class ProposeAlternativePageEvent extends BaseEvent {}


class ProposeAlternativeClickedEvent extends ProposeAlternativePageEvent{
  final RescheduleEntity rescheduleEntity;

  ProposeAlternativeClickedEvent({required this.rescheduleEntity});
}
