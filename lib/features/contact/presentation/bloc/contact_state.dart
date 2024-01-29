part of 'contact_bloc.dart';

@immutable
abstract class ContactPageState extends BaseState {
  final String? error;
  ContactPageState({super.dataState, this.error});
}

class MyReviewsPageInitialState extends ContactPageState {
  MyReviewsPageInitialState({super.error});
}

class GetPageDataState extends ContactPageState {
  GetPageDataState({super.error});
}

