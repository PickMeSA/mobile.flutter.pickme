part of 'my_reviews_bloc.dart';

@immutable
abstract class MyReviewsPageState extends BaseState {
  final String? error;
  MyReviewsPageState({super.dataState, this.error});
}

class MyReviewsPageInitialState extends MyReviewsPageState {
  MyReviewsPageInitialState({super.error});
}

class GetPageDataState extends MyReviewsPageState {
  GetPageDataState({super.error});
}

