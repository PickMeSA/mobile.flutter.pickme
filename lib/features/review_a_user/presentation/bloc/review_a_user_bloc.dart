import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/review_a_user/domain/use_cases/submit_review_use_case.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

import '../../domain/entities/review_a_user_page_entity.dart';
import '../../domain/use_cases/get_review_user_page_entity_use_case.dart';


part 'review_a_user_event.dart';
part 'review_a_user_state.dart';

@injectable
class ReviewAUserBloc extends BaseBloc<ReviewAUserPageEvent, ReviewAUserState> {

  final GetReviewUserPageEntityUseCase getReviewUserPageEntityUseCase;
  final SubmitReviewUseCase submitReviewUseCase;
  ReviewAUserPageEntity? pageEntity;
  bool preloaderActive = false;
  final Logger logger = Logger();
  int rating = 0;
  String reviewText = "";

  ReviewAUserBloc({
    required this.getReviewUserPageEntityUseCase,
    required this.submitReviewUseCase,}) : super(MyReviewsPageInitialState()) {
    on<ReviewAUserPageEnteredEvent>((event, emit) => _onAllServicesPageEnteredEvent(event, emit));
    on<RatingChangedEvent>((event, emit) => _onRatingChangedEvent(event, emit));
    on<ReviewTextChangedEvent>((event, emit) => _onReviewTextChangedEvent(event, emit));
    on<SubmitClickedEvent>((event, emit) => _onSubmitClickedEvent(event, emit));
  }

  _onAllServicesPageEnteredEvent(
      ReviewAUserPageEnteredEvent event,
      Emitter<ReviewAUserState> emit
      )async{
    emit(GetPageDataState()..dataState = DataState.loading);
    try{
      pageEntity = await getReviewUserPageEntityUseCase.call(
          params: GetReviewUserPageEntityUseCaseParams(userId: event.userId));
      emit(GetPageDataState()..dataState = DataState.success);
    }catch(ex){
      emit(GetPageDataState(error: ex.toString())..dataState = DataState.error);
    }
  }
  _onRatingChangedEvent(
      RatingChangedEvent event,
      Emitter<ReviewAUserState> emit
      )async{
    emit(RatingChangedState()..dataState = DataState.loading);
    try{
      rating = event.value;
      emit(RatingChangedState()..dataState = DataState.success);
    }catch(ex){
      emit(RatingChangedState(error: ex.toString())..dataState = DataState.error);
    }
  }
  _onReviewTextChangedEvent(
      ReviewTextChangedEvent event,
      Emitter<ReviewAUserState> emit
      )async{
    emit(RatingChangedState()..dataState = DataState.loading);
    try{
      reviewText = event.value;
      emit(RatingChangedState()..dataState = DataState.success);
    }catch(ex){
      emit(RatingChangedState(error: ex.toString())..dataState = DataState.error);
    }
  }
  _onSubmitClickedEvent(
      SubmitClickedEvent event,
      Emitter<ReviewAUserState> emit
      )async{
    emit(SubmitClickedState()..dataState = DataState.loading);
    try{
      UserModel userModel = boxUser.get(current);
      bool result = await submitReviewUseCase.call(params: SubmitReviewUseCaseParams(
        reviewerId: userModel.id!,
        userId: event.userId,
        review: reviewText,
        rating: rating
      ));
      if(result){
        emit(SubmitClickedState()..dataState = DataState.success);
      }else{
        emit(SubmitClickedState(error: "An error occurred")..dataState = DataState.error);
      }
    }catch(ex){
      emit(SubmitClickedState(error: ex.toString())..dataState = DataState.error);
    }
  }

}
