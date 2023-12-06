import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/constants/numerical.dart';
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
    FinalDetailsBloc({required this.uploadFileUseCase}): super(FinalDetailsPageInitState()) {
        on<ProfilePictureAddedEvent>((event, emit) => _onProfilePictureAddedEvent(event, emit));
    }
    _onProfilePictureAddedEvent(ProfilePictureAddedEvent event, Emitter<FinalDetailsPageState> emit) async{
        File file = File(event.filePath);
        try{
            validateFile(file);
            UploadedFileEntity uploadedFileEntity = await uploadFileUseCase.call(params: UploadFileUseCaseParams(filePath: event.filePath));
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
