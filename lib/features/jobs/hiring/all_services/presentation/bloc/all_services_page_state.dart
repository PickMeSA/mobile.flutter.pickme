part of 'all_services_page_bloc.dart';

@immutable
abstract class AllServicesPageState extends BaseState {
  AllServicesPageState({super.dataState});

}

class AllServicesPageInitial extends AllServicesPageState {
  AllServicesPageInitial();
}

class SeeAllClickedState extends AllServicesPageState {
  SeeAllClickedState();
}
