part of 'contact_bloc.dart';

@immutable
abstract class ContactPageEvent extends BaseEvent {}

class ContactPageEnteredEvent extends ContactPageEvent{
  final String? userId;
  ContactPageEnteredEvent({this.userId});
}

class SearchTextChangedEvent extends ContactPageEvent{
  final String searchText;
  SearchTextChangedEvent({required this.searchText});
}
