import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';
import 'package:pickme/features/jobs/hiring/landing_page/domain/use_cases/otp_usecase/get_industries_usecase.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:logger/logger.dart';
part 'jobs_hiring_landing_page_event.dart';
part 'jobs_hiring_landing_page_state.dart';

@injectable
class JobsHiringLandingPageBloc extends BaseBloc<JobsHiringLandingPageEvent, JobsHiringLandingPageState> {
  final GetIndustriesUseCase getIndustriesUseCase;
  PaginatedIndustryEntity? paginatedIndustries;
  Logger logger = Logger();
  JobsHiringLandingPageBloc({required this.getIndustriesUseCase}) : super(JobsHiringLandingPageInitial()) {
    on<JobsHiringLandingPageEnteredEvent>((event, emit) => _onJobsHiringLandingPageEnteredEvent(event, emit));
    on<SeeAllClickedEvent>((event, emit) => _onSeeAllClickedEventEvent(event, emit));
  }
  _onSeeAllClickedEventEvent(
      SeeAllClickedEvent event,
      Emitter<JobsHiringLandingPageState> emit
      ) {
  // go to all page
  }
  _onJobsHiringLandingPageEnteredEvent(
      JobsHiringLandingPageEnteredEvent event,
      Emitter<JobsHiringLandingPageState> emit
      )async{
    emit(GetTopIndustriesState()..dataState = DataState.loading);
    try{
      PaginatedIndustryEntity paginatedIndustryEntity = await getIndustriesUseCase.call(
          params: GetIndustriesUseCaseParams());
      paginatedIndustries = paginatedIndustryEntity;
      emit(GetTopIndustriesState(paginatedIndustries: paginatedIndustryEntity)..dataState = DataState.success);
    }catch(ex){
      logger.e(ex);
      emit(GetTopIndustriesState()..dataState = DataState.error);
    }
  }
}
