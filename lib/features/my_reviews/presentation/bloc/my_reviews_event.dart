part of 'my_reviews_bloc.dart';

@immutable
abstract class MyReviewsPageEvent extends BaseEvent {}

class MyReviewsPageEnteredEvent extends MyReviewsPageEvent{
  final String? userId;
  MyReviewsPageEnteredEvent({this.userId});
}

class SearchTextChangedEvent extends MyReviewsPageEvent{
  final String searchText;
  SearchTextChangedEvent({required this.searchText});
}
