import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/final_details/domain/entities/final_details_entity.dart';
import 'package:pickme/features/final_details/domain/usecases/submit_final_details_usecase.dart';
import 'package:pickme/features/profile/domain/use_cases/profile_usecase/delete_profile_usecase.dart';
import 'package:pickme/shared/constants/numerical.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart';
import 'package:pickme/shared/features/upload_file/domain/entities/uploaded_file_entity.dart';
import 'package:pickme/shared/features/upload_file/domain/usecases/upload_file_usecase.dart';

import '../../../final_details/domain/models/final_details_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc
    extends BaseBloc<ProfilePageEvent, ProfilePageState> {
    final DeleteProfileUseCase deleteProfileUseCase;
    final GetRemoteProfileUseCase getRemoteProfileUseCase;
    final UploadFileUseCase uploadFileUseCase;
    final SubmitFinalDetailsUseCase submitFinalDetailsUseCase;
    FinalDetailsEntity finalDetailsEntity =  FinalDetailsEntity();
    ProfileBloc({
        required this.submitFinalDetailsUseCase,
        required  this.uploadFileUseCase,
        required this.deleteProfileUseCase,
        required this.getRemoteProfileUseCase
    }): super(ProfilePageInitState()) {
        on<UpdateUIEvent>((event, emit)=> _onUpdateUIEvent(event,emit));
        on<GetProfileDetailsEvent>((event, emit)=> _onGetProfileDetailsEvent(event, emit));
        on<ProfilePictureAddedEvent>((event, emit) => _onProfilePictureAddedEvent(event, emit));
        on<DeleteProfileEvent>((event, emit)=> _onDeleteProfileEvent(event,emit));
        on<SubmitClickedEvent>((event, emit) => _onSubmitClickedEvent(event, emit));
    }


    late List<ChipOption> skills;

    Future<void> _onDeleteProfileEvent(
        DeleteProfileEvent event,
        Emitter<ProfilePageState> emit
        )async{
        emit(DeleteProfileState()..dataState = DataState.loading);
        try{
            await deleteProfileUseCase.call();
                emit(DeleteProfileState()..dataState = DataState.success);

        }catch(ex){
            emit(DeleteProfileState(error: ex.toString())..dataState = DataState.error);
        }
    }

    Future<void> _onUpdateUIEvent(
        UpdateUIEvent event,
        Emitter<ProfilePageState> emit
        )async{
        emit(UpdateUIState()..dataState = DataState.success);
    }


    Future<void> _onGetProfileDetailsEvent(
        GetProfileDetailsEvent event,
        Emitter<ProfilePageState> emit
        )async{
        emit(GetProfileDetailsState()..dataState = DataState.loading);
        try{
            profileEntity = await getRemoteProfileUseCase.call();
            skills = [];
            profileEntity!.skills!.forEach((element) {
                skills.add(ChipOption(label: element.skill!, id: element.id!));
            });
            emit(GetProfileDetailsState()..dataState = DataState.success);
        }catch(ex){
            emit(GetProfileDetailsState(error:ex.toString())..dataState = DataState.error);
        }
    }

    _onProfilePictureAddedEvent(ProfilePictureAddedEvent event, Emitter<ProfilePageState> emit) async{

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

    _onSubmitClickedEvent(SubmitClickedEvent event, Emitter<ProfilePageState> emit) async{

            emit(SubmitClickedState()..dataState = DataState.loading);

            try{

                ProfileEntity profileEntity = await submitFinalDetailsUseCase.call(params: SubmitFinalDetailsUseCaseParams(finalDetailsEntity: finalDetailsEntity.copyWith(newDescription: this.profileEntity?.description)));

                emit(SubmitClickedState(profileEntity:  profileEntity)..dataState = DataState.success);

            }catch(ex){

                emit(SubmitClickedState(error: ex.toString())..dataState = DataState.error);
            }

    }
} 
