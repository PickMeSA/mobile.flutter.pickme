import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';

import '../../../../shared/domain/entities/create_job_page_job_entity.dart';
import '../../../../shared/domain/entities/job_entity.dart';
import '../../domain/use_cases/create_job_listing_usecase.dart';

part 'review_job_listing_details_event.dart';
part 'review_job_listing_details_state.dart';

@injectable
class ReviewJobListingInfoBloc extends BaseBloc<ReviewJobEvent, ReviewJobListingState> {
  final CreateJobListingUseCase createJobListingUseCase;
  bool preloaderActive = false;
  Logger logger = Logger();

  ReviewJobListingInfoBloc({required this.createJobListingUseCase}) : super(ReviewJobListingStatePageInitial()) {
    on<ReviewJobPageSubmitJobEvent>((event, emit) => _onReviewJobPageSubmitJobEvent(event, emit));
  }
  _onReviewJobPageSubmitJobEvent(ReviewJobPageSubmitJobEvent event,
      Emitter<ReviewJobListingState> emit) async{
    emit(ReviewJobPageSubmitJobState()..dataState=DataState.loading);
    try{
      JobEntity insertedJob = await createJobListingUseCase.call(params: CreateJobListingUseCaseParams(jobEntity: event.job));
      logger.d(insertedJob);
      emit(ReviewJobPageSubmitJobState()..dataState = DataState.success);
    }catch(ex){
      logger.e(ex);

      emit(ReviewJobPageSubmitJobState()..dataState = DataState.error);
    }
  }
}
