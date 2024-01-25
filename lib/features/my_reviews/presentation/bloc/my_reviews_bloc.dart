import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

import '../../domain/entities/my_reviews_page_entity.dart';
import '../../domain/use_cases/get_my_reviews_page_entity_use_case.dart';


part 'my_reviews_event.dart';
part 'my_reviews_state.dart';

@injectable
class MyReviewsPageBloc extends BaseBloc<MyReviewsPageEvent, MyReviewsPageState> {

  final GetMyReviewsPageEntityUseCase getMyReviewsUseCase;
  MyReviewsPageEntity? pageEntity;
  bool preloaderActive = false;
  final Logger logger = Logger();
  bool isMyProfile = false;

  MyReviewsPageBloc({
    required this.getMyReviewsUseCase,}) : super(MyReviewsPageInitialState()) {
    on<MyReviewsPageEnteredEvent>((event, emit) => _onMyReviewsPageEnteredEvent(event, emit));
  }

  _onMyReviewsPageEnteredEvent(
      MyReviewsPageEnteredEvent event,
      Emitter<MyReviewsPageState> emit
      )async{
    emit(GetPageDataState()..dataState = DataState.loading);
    try{
      UserModel userModel = boxUser.get(current);
      String userId = event.userId??userModel.id!;
      pageEntity = await getMyReviewsUseCase.call(
          params: GetMyReviewsUseCaseParams(userId: userId));
      emit(GetPageDataState()..dataState = DataState.success);
    }catch(ex){
      emit(GetPageDataState(error: ex.toString())..dataState = DataState.error);
    }
  }

}
