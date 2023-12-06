import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/final_details/domain/entities/final_details_entity.dart';
import 'package:pickme/features/final_details/domain/usecases/submit_final_details_usecase.dart';
import 'package:pickme/shared/constants/numerical.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/usecases/upload_file_usecase.dart';

part 'final_details_event.dart';
part 'final_details_state.dart';

@injectable
class FinalDetailsBloc
    extends BaseBloc<FinalDetailsPageEvent, FinalDetailsPageState> {
    bool checked = true;
    String uploadErrorMessage = "";
    UploadFileUseCase uploadFileUseCase;
    SubmitFinalDetailsUseCase submitFinalDetailsUseCase;
    FinalDetailsEntity finalDetailsEntity = const FinalDetailsEntity();
    FinalDetailsBloc({required this.uploadFileUseCase, required this.submitFinalDetailsUseCase}): super(FinalDetailsPageInitState()) {
        on<ProfilePictureAddedEvent>((event, emit) => _onProfilePictureAddedEvent(event, emit));
        on<PoliceClearanceAddedEvent>((event, emit) => _onPoliceClearanceAddedEvent(event, emit));
        on<SubmitClickedEvent>((event, emit) => _onSubmitClickedEvent(event, emit));
    }
    _onSubmitClickedEvent(SubmitClickedEvent event, Emitter<FinalDetailsPageState> emit) async{
        if(event.description.isEmpty){
            emit(SubmitClickedState()..dataState = DataState.error);
        }else{
            finalDetailsEntity = finalDetailsEntity.copyWith(newDescription: event.description);
            try{
                ProfileEntity profileEntity = await submitFinalDetailsUseCase.call(params: SubmitFinalDetailsUseCaseParams(finalDetailsEntity: finalDetailsEntity));
                emit(SubmitClickedState()..dataState = DataState.success);

            }catch(ex){
                uploadErrorMessage = ex.toString();
                emit(ProfilePictureAddedState()..dataState = DataState.error);
            }
        }
    }
    _onProfilePictureAddedEvent(ProfilePictureAddedEvent event, Emitter<FinalDetailsPageState> emit) async{
        File file = File(event.filePath);
        try{
            validateFile(file);
            UploadedFileEntity uploadedFileEntity = await uploadFileUseCase.call(params: UploadFileUseCaseParams(filePath: event.filePath));
            finalDetailsEntity = finalDetailsEntity.copyWith(newProfilePicture: uploadedFileEntity);
        }catch(ex){
            uploadErrorMessage = ex.toString();
            emit(ProfilePictureAddedState()..dataState = DataState.error);
        }
    }
    _onPoliceClearanceAddedEvent(PoliceClearanceAddedEvent event, Emitter<FinalDetailsPageState> emit) async{
        File file = File(event.filePath);
        try{
            validateFile(file);
            UploadedFileEntity uploadedFileEntity = await uploadFileUseCase.call(params: UploadFileUseCaseParams(filePath: event.filePath));
            finalDetailsEntity = finalDetailsEntity.copyWith(newPoliceClearance: uploadedFileEntity);
        }catch(ex){
            uploadErrorMessage = ex.toString();
            emit(ProfilePictureAddedState()..dataState = DataState.error);
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
