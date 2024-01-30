part of 'review_a_user_bloc.dart';

@immutable
abstract class ReviewAUserState extends BaseState {
  final String? error;
  ReviewAUserState({super.dataState, this.error});
}

class MyReviewsPageInitialState extends ReviewAUserState {
  MyReviewsPageInitialState({super.error});
}

class GetPageDataState extends ReviewAUserState {
  GetPageDataState({super.error});
}
class RatingChangedState extends ReviewAUserState {
  RatingChangedState({super.error});
}
class SubmitClickedState extends ReviewAUserState {
  SubmitClickedState({super.error});
}

