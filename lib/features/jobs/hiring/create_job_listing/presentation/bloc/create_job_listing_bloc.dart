import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/constants/numerical.dart';
import 'package:logger/logger.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';

import '../../../../../../shared/features/upload_file/domain/usecases/upload_file_usecase.dart';
part 'create_job_listing_event.dart';
part 'create_job_listing_state.dart';

@injectable
class CreateJobListingBloc extends BaseBloc<CreateJobListingsEvent, CreateJobListingState> {
  List<UploadedFileEntity> photos = [];
  UploadFileUseCase uploadFileUseCase;
  int selectedTabIndex = 0;
  Logger logger = Logger();
  bool flexibleHoursChecked = false;

  CreateJobListingBloc({required this.uploadFileUseCase}) : super(CreateJobListingInitial()) {
    on<CreateJobListingPageEnteredEvent>((event, emit) => _onMyJobListingsPageEnteredEvent(event, emit));
    on<JobImageAddedClickedEvent>((event, emit) => _onAddJobImageClickedEvent(event, emit));
    on<FlexibleHoursCheckboxChangedEvent>((event, emit) => _onFlexibleHoursCheckboxChangedEvent(event, emit));
  }

  _onAddJobImageClickedEvent(
      JobImageAddedClickedEvent event,
      Emitter<CreateJobListingState> emit
      ) async {
    File file = File(event.filePath);
    try{
      emit(JobImageAddedState()..dataState = DataState.loading);
      validateFile(file);
      UploadedFileEntity uploadedFileEntity = await uploadFileUseCase.call(params: UploadFileUseCaseParams(filePath: event.filePath));
      photos.add(uploadedFileEntity);
      emit(JobImageAddedState()..dataState = DataState.success);
    }catch(ex){
      emit(JobImageAddedState(error: ex.toString())..dataState = DataState.error);
    }
  }
  _onFlexibleHoursCheckboxChangedEvent(
      FlexibleHoursCheckboxChangedEvent event,
      Emitter<CreateJobListingState> emit
      ){
    flexibleHoursChecked = event.checked;
    emit(FlexibleHoursChangedState()..dataState = DataState.success);
  }
  _onMyJobListingsPageEnteredEvent(
      CreateJobListingPageEnteredEvent event,
      Emitter<CreateJobListingState> emit
      )async{

  }
  void validateFile(File file){
    // Limit the file size
    const maxSizeInBytes = maxUploadSize * 1024 * 1024;

    if (file.lengthSync() > maxSizeInBytes) {
      throw('File size exceeds the limit of $maxUploadSize megabytes.');
    }
  }

}
