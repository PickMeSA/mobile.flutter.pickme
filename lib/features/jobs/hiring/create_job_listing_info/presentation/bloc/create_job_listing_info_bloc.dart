import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';

import '../../domain/entities/create_job_listing_info_page_entity.dart';
import '../../domain/use_cases/otp_usecase/get_job_listings_info_usecase.dart';

part 'create_job_listing_info_event.dart';
part 'create_job_listing_info_state.dart';

@injectable
class CreateJobListingInfoBloc extends BaseBloc<MyJobListingsEvent, CreateJobListingState> {
  final GetJobListingsInfoUseCase getJobListingsInfoUseCase;
  CreateJobListingInfoPageEntity? pageInfo;
  bool preloaderActive = false;
  Logger logger = Logger();

  CreateJobListingInfoBloc({required this.getJobListingsInfoUseCase}) : super(MyJobListingsPageInitial()) {
    on<CreateJobListingInfoPageEnteredEvent>((event, emit) => _onMyJobListingsPageEnteredEvent(event, emit));
  }

  _onMyJobListingsPageEnteredEvent(
      CreateJobListingInfoPageEnteredEvent event,
      Emitter<CreateJobListingState> emit
      )async{
    emit(CreateJobListingInfoPageEnteredState()..dataState=DataState.loading);
    try{
      pageInfo =  await getJobListingsInfoUseCase.call();
      emit(CreateJobListingInfoPageEnteredState()..dataState=DataState.success);
    }catch(ex){
      rethrow;
    }

  }
}
