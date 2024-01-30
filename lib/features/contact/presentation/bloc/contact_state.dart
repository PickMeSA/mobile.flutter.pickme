part of 'contact_bloc.dart';

@immutable
abstract class ContactPageState extends BaseState {
  final String? error;
  ContactPageState({super.dataState, this.error});
}

class ContactPageInitialState extends ContactPageState {
  ContactPageInitialState({super.error});
}

class GetPageDataState extends ContactPageState {
  GetPageDataState({super.error});
}

