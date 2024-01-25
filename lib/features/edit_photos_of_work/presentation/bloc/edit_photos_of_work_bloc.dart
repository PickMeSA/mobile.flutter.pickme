import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/final_details/domain/usecases/submit_final_details_usecase.dart';
import 'package:pickme/features/final_details/presentation/bloc/final_details_bloc.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/usecases/upload_file_usecase.dart';

part 'edit_photos_of_work_event.dart';
part 'edit_photos_of_work_state.dart';

@injectable
class EditPhotosOfWorkBloc
    extends BaseBloc<EditPhotosOfWorkPageEvent, EditPhotosOfWorkPageState> {

    final UploadFileUseCase uploadFileUseCase;

    EditPhotosOfWorkBloc({required this.uploadFileUseCase}): super(EditPhotosOfWorkPageInitState()) {
        on<ProfilePictureAddedEvent>((event, emit) => _onProfilePictureAddedEvent(event, emit));
        on<RemoveImageClickedEvent>((event, emit) => _onRemoveImageClickedEvent(event, emit));
    }

    _onProfilePictureAddedEvent(
        ProfilePictureAddedEvent event,
        Emitter<EditPhotosOfWorkPageState> emit) async{

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
        Emitter<EditPhotosOfWorkPageState> emit
        )async{
        emit(RemoveImageClickedState(index: event.index)..dataState = DataState.success);
    }
} 
