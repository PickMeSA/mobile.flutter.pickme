part of 'review_a_user_bloc.dart';

@immutable
abstract class ReviewAUserPageEvent extends BaseEvent {}

class ReviewAUserPageEnteredEvent extends ReviewAUserPageEvent{
  ReviewAUserPageEnteredEvent();
}

class SearchTextChangedEvent extends ReviewAUserPageEvent{
  final String searchText;
  SearchTextChangedEvent({required this.searchText});
}
