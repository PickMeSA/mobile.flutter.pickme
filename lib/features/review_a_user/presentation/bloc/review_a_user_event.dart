part of 'review_a_user_bloc.dart';

@immutable
abstract class ReviewAUserPageEvent extends BaseEvent {}

class ReviewAUserPageEnteredEvent extends ReviewAUserPageEvent{
  final String userId;
  ReviewAUserPageEnteredEvent({required this.userId});
}

class RatingChangedEvent extends ReviewAUserPageEvent{
  final int value;
  RatingChangedEvent({required this.value});
}

class ReviewTextChangedEvent extends ReviewAUserPageEvent{
  final String value;
  ReviewTextChangedEvent({required this.value});
}

class SubmitClickedEvent extends ReviewAUserPageEvent{
  String userId;
  SubmitClickedEvent({required this.userId});
}
