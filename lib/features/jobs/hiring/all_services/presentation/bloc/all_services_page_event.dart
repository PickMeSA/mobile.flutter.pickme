part of 'all_services_page_bloc.dart';

@immutable
abstract class AllServicesPageEvent extends BaseEvent {}

class SeeAllClickedEvent extends AllServicesPageEvent{
  SeeAllClickedEvent();
}
