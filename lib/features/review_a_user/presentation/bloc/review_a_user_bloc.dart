import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/my_reviews/domain/entities/my_reviews_page_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

import '../../domain/use_cases/get_my_reviews_page_entity_use_case.dart';


part 'review_a_user_event.dart';
part 'review_a_user_state.dart';

@injectable
class ReviewAUserBloc extends BaseBloc<ReviewAUserPageEvent, ReviewAUserState> {

  final GetMyReviewsPageEntityUseCase1 getMyReviewsUseCase;
  MyReviewsPageEntity? pageEntity;
  bool preloaderActive = false;
  final Logger logger = Logger();

  ReviewAUserBloc({
    required this.getMyReviewsUseCase,}) : super(MyReviewsPageInitialState()) {
    on<ReviewAUserPageEnteredEvent>((event, emit) => _onAllServicesPageEnteredEvent(event, emit));
  }

  _onAllServicesPageEnteredEvent(
      ReviewAUserPageEnteredEvent event,
      Emitter<ReviewAUserState> emit
      )async{
    emit(GetPageDataState()..dataState = DataState.loading);
    try{
      UserModel userModel = boxUser.get(current);
      pageEntity = await getMyReviewsUseCase.call(
          params: GetMyReviewsUseCaseParams(userId: userModel.id!));
      emit(GetPageDataState()..dataState = DataState.success);
    }catch(ex){
      emit(GetPageDataState(error: ex.toString())..dataState = DataState.error);
    }
  }

}
