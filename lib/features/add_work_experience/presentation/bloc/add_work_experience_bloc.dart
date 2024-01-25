import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/add_skills/domain/entities/prefered_industry_list_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart';
import 'package:pickme/features/final_details/presentation/bloc/final_details_bloc.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/usecases/upload_file_usecase.dart';

part 'add_work_experience_event.dart';
part 'add_work_experience_state.dart';

@injectable
class AddWorkExperienceBloc
    extends BaseBloc<AddWorkExperiencePageEvent, AddWorkExperiencePageState> {

    bool current = false;
    List<DropdownMenuEntry<PreferredIndustryEntity>> industryEntries
    = <DropdownMenuEntry<PreferredIndustryEntity>>[];
    late PreferredIndustryListEntity preferredIndustryListEntity;
    late PreferredIndustryEntity selectedIndustry;
    final AddSkillsGetIndustryListUseCase addSkillsGetIndustryListUseCase;
     final UploadFileUseCase uploadFileUseCase;
    AddWorkExperienceBloc({required this.addSkillsGetIndustryListUseCase, required this.uploadFileUseCase}):
            super(AddWorkExperiencePageInitState()) {
        on<AddWorkExperienceCurrentSelectedEvent>((event, emit)=> _onAddWorkExperienceCurrentSelectedEvent(event, emit));
        on<AddWorkExperienceGetPreferredIndustryListEvent>((event, emit) => _onAddWorkGetPreferredIndustryListEvent(event, emit));
        on<PreferredIndustrySelectedEvent>((event, emit) => _onPreferredIndustrySelectedEvent(event,emit));
        on<ProfilePictureAddedEvent>((event, emit) => _onProfilePictureAddedEvent(event, emit));
        on<RemoveImageClickedEvent>((event, emit) => _onRemoveImageClickedEvent(event, emit));
    }

    _onProfilePictureAddedEvent(
        ProfilePictureAddedEvent event,
        Emitter<AddWorkExperiencePageState> emit) async{

        File file = File(event.filePath);
        try{
            emit(ProfilePictureAddedState()..dataState = DataState.loading);
            validateFile(file);
            UploadedFileEntity uploadedFileEntity = await uploadFileUseCase.call(params: UploadFileUseCaseParams(filePath: event.filePath));
            emit(ProfilePictureAddedState(uploadFileEntity:  uploadedFileEntity)..dataState = DataState.success);
        }catch(ex){
            emit(ProfilePictureAddedState(error: ex.toString())..dataState = DataState.error);
        }
    }

    _onRemoveImageClickedEvent(
        RemoveImageClickedEvent event,
        Emitter<AddWorkExperiencePageState> emit
        )async{
        emit(RemoveImageClickedState(index: event.index)..dataState = DataState.success);
    }

    _onAddWorkExperienceCurrentSelectedEvent(
        AddWorkExperienceCurrentSelectedEvent event,
        Emitter<AddWorkExperiencePageState> emit
        ) async{

        current = !current;
        emit(AddWorkExperienceCurrentSelectedState());

    }

    _onAddWorkGetPreferredIndustryListEvent(
        AddWorkExperienceGetPreferredIndustryListEvent event,
        Emitter<AddWorkExperiencePageState> emit
        )async{
        emit(AddWorkGetPreferredIndustryListState()..dataState = DataState.loading);
        try{
            industryEntries.clear();
            preferredIndustryListEntity = await addSkillsGetIndustryListUseCase.call();
            preferredIndustryListEntity.preferredIndustryListEntity!.forEach((element) {
                industryEntries.add(DropdownMenuEntry(value: element, label: element.industry!));
            });

            emit(AddWorkGetPreferredIndustryListState()..dataState = DataState.success);
        }catch(ex){
            emit(AddWorkGetPreferredIndustryListState(error: ex.toString())..dataState = DataState.loading);
        }
    }

    _onPreferredIndustrySelectedEvent(
        PreferredIndustrySelectedEvent event,
        Emitter<AddWorkExperiencePageState> emit
        )async{
        selectedIndustry = event.preferredIndustry;
    }


} 
