part of 'lets_begin_bloc.dart';
 @immutable
abstract class LetsBeginPageEvent extends BaseEvent {}


class ValueChangedEvent extends LetsBeginPageEvent {
 LetsBeginEntity letsBeginEntity;

 ValueChangedEvent({
  required this.letsBeginEntity
 });
}