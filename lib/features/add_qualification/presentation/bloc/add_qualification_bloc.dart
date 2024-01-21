import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/final_details/domain/entities/final_details_entity.dart';
import 'package:pickme/shared/constants/numerical.dart';
import 'package:pickme/shared/constants/qualifications.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/usecases/upload_file_usecase.dart';

part 'add_qualification_event.dart';
part 'add_qualification_state.dart';

@injectable
class AddQualificationBloc
    extends BaseBloc<AddQualificationPageEvent, AddQualificationPageState> {
    AddQualificationBloc({required this.uploadFileUseCase}): super(AddQualificationPageInitState()) {
        on<GetPageInformationEvent>((event, emit)=> _onGetPageInformationEvent(event,emit));
        on<ProfilePictureAddedEvent>((event,emit)=> _onProfilePictureAddedEvent(event, emit));
    }
    late String uploadErrorMessage;
    final UploadFileUseCase uploadFileUseCase;
     FinalDetailsEntity finalDetailsEntity = FinalDetailsEntity();
    bool preloader = false;

    _onGetPageInformationEvent(GetPageInformationEvent event,
        Emitter<AddQualificationPageState> emit){
        List<DropdownMenuEntry<Qualifications>> qualificationEntries = [];
        for (Qualifications qualification in qualificationList){
            qualificationEntries.add(DropdownMenuEntry(value: qualification, label: qualification.name));
        }
        emit(GetPageInformationState(entries: qualificationEntries));
    }


    _onProfilePictureAddedEvent(ProfilePictureAddedEvent event, Emitter<AddQualificationPageState> emit) async{
        uploadErrorMessage = "";
        File file = File(event.filePath);
        try{
            emit(ProfilePictureAddedState()..dataState = DataState.loading);
            validateFile(file);
            UploadedFileEntity uploadedFileEntity = await uploadFileUseCase.call(params: UploadFileUseCaseParams(filePath: event.filePath));
            finalDetailsEntity = finalDetailsEntity.copyWith(newProfilePicture: uploadedFileEntity);
            emit(ProfilePictureAddedState()..dataState = DataState.success);
        }catch(ex){

            emit(ProfilePictureAddedState(error: ex.toString())..dataState = DataState.error);
        }
    }

    void validateFile(File file){
        // Limit the file size
        const maxSizeInBytes = maxUploadSize * 1024 * 1024;

        if (file.lengthSync() > maxSizeInBytes) {
            throw('File size exceeds the limit of $maxUploadSize megabytes.');
        }
    }
} 
