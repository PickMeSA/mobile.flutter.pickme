import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/entities/skill_entity.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/usecases/get_skills_list_usecase.dart';

import 'package:pickme/shared/constants/numerical.dart';
import 'package:logger/logger.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';

import '../../../../../../shared/features/upload_file/domain/usecases/upload_file_usecase.dart';
part 'create_job_listing_event.dart';
part 'create_job_listing_state.dart';

@injectable
class CreateJobListingBloc extends BaseBloc<CreateJobListingsEvent, CreateJobListingState> {
  List<UploadedFileEntity> photos = [];
  UploadFileUseCase uploadFileUseCase;
  GetSkillsListUseCase getSkillsListUseCase;
  int selectedTabIndex = 0;
  Logger logger = Logger();
  bool flexibleHoursChecked = false;
  LocationSource locationSource = LocationSource.profile;
  List<DropdownMenuItem<JobsSkillEntity>> skillEntries = [];
  JobsSkillListEntity selectedSkills = JobsSkillListEntity(skillListEntity: []);
  List<ChipOption> chipOptions = [];
  bool preloaderActive = false;
  OTPLocationEntity? otpLocationEntity;

  CreateJobListingBloc({required this.uploadFileUseCase,
    required this.getSkillsListUseCase}) : super(CreateJobListingInitial()) {
    on<CreateJobListingPageEnteredEvent>((event, emit) => _onCreateJobListingPageEnteredEvent(event, emit));
    on<JobImageAddedClickedEvent>((event, emit) => _onAddJobImageClickedEvent(event, emit));
    on<FlexibleHoursCheckboxChangedEvent>((event, emit) => _onFlexibleHoursCheckboxChangedEvent(event, emit));
    on<SkillSelectedEvent>((event, emit) => _onSkillSelectedEvent(event, emit));
    on<SkillChipDeletedEvent>((event, emit) => _onSkillChipDeletedEvent(event, emit));
    on<LocationFromProfileToggledEvent>((event, emit) => _onLocationFromProfileToggledEvent(event, emit));
    on<LocationSelectedEvent>((event, emit)=> _onLocationSelectedEvent(event, emit));
    on<DateChangedEvent>((event, emit)=> _onDateChangedEvent(event, emit));
  }
  Future<void> _onLocationSelectedEvent(
      LocationSelectedEvent event,
      Emitter<CreateJobListingState> emit
      )async{
    emit(LocationFromProfileToggledState(locationSource: LocationSource.map)..dataState = DataState.loading);
    try{
      otpLocationEntity = event.otpLocationEntity;
      emit(LocationFromProfileToggledState(locationSource: LocationSource.map)..dataState = DataState.success);

    }catch(ex){
      emit(LocationFromProfileToggledState(locationSource: LocationSource.map)..dataState = DataState.error);
    }
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
      logger.d(photos);
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
    emit(FlexibleHoursChangedState(flexibleHoursChecked:flexibleHoursChecked)..dataState = DataState.success);
  }
  _onCreateJobListingPageEnteredEvent(
      CreateJobListingPageEnteredEvent event,
      Emitter<CreateJobListingState> emit
      )async{
    emit(GetSkillsListState()..dataState = DataState.loading);
    try{
      JobsSkillListEntity skillListEntity = await getSkillsListUseCase.call();
      skillEntries = skillListEntity.skillListEntity!.map((e) => DropdownMenuItem(value: e, child: Text(e.skill!))).toList();
      emit(GetSkillsListState()..dataState = DataState.success);
    }catch(ex){
      emit(GetSkillsListState(error: ex.toString())..dataState = DataState.error);
    }

  }
  _onSkillSelectedEvent(SkillSelectedEvent event,
      Emitter<CreateJobListingState> emit){
    bool alreadyExists = false;
      for(int i=0; i<chipOptions.length; i++){
        ChipOption option = chipOptions[i];
        if(option.id.toString() == event.skill.id) {
          alreadyExists = true;
          chipOptions.removeAt(i);
          break;
        }
      }
      if(!alreadyExists && chipOptions.length<5) {
        chipOptions.add(
            ChipOption(label: event.skill.skill!, id: int.parse(event.skill.id!)));
        selectedSkills.skillListEntity?.add(event.skill);
        // checked = true;
      }
      if(chipOptions.length>4){
        return emit(SkillSelectedState()..dataState = DataState.error);
      }
    emit(SkillSelectedState()..dataState = DataState.success);
  }

  _onSkillChipDeletedEvent(SkillChipDeletedEvent event,
      Emitter<CreateJobListingState> emit){
    chipOptions.removeAt(event.index);

    emit(SkillChipDeletedState()..dataState = DataState.success);
  }
  _onLocationFromProfileToggledEvent(LocationFromProfileToggledEvent event,
      Emitter<CreateJobListingState> emit){
    emit(LocationFromProfileToggledState(locationSource: event.locationSource)..dataState = DataState.init);
    locationSource = event.locationSource;
    emit(LocationFromProfileToggledState(locationSource: event.locationSource)..dataState = DataState.success);
  }
  _onDateChangedEvent(DateChangedEvent event,
      Emitter<CreateJobListingState> emit){
    emit(DateChangedState()..dataState = DataState.loading);
    emit(DateChangedState()..dataState = DataState.success);
  }
  void validateFile(File file){
    // Limit the file size
    const maxSizeInBytes = maxUploadSize * 1024 * 1024;

    if (file.lengthSync() > maxSizeInBytes) {
      throw('File size exceeds the limit of $maxUploadSize megabytes.');
    }
  }


}
