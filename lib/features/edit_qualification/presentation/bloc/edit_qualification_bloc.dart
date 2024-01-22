import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/qualification/domain/entities/submit_qualification_and_experience_entity.dart';
import 'package:pickme/features/qualification/domain/use_cases/qualification_usecase/submit_remote_qualifications_and_experience_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experience_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

part 'edit_qualification_event.dart';
part 'edit_qualification_state.dart';

@injectable
class EditQualificationBloc
    extends BaseBloc<EditQualificationPageEvent, EditQualificationPageState> {

    final SubmitRemoteQualificationAndExperienceUseCase submitRemoteQualificationAndExperienceUseCase;

    EditQualificationBloc({required this.submitRemoteQualificationAndExperienceUseCase})
        : super(EditQualificationPageInitState()) {
        on<EditQualificationAddQualificationEvent>((event, emit)=> _onEditQualificationAddQualificationEvent(event, emit));
    }

    Future<void> _onEditQualificationAddQualificationEvent(
        EditQualificationAddQualificationEvent event,
        Emitter<EditQualificationPageState> emit
        )async{
        emit(EditQualificationAddWorkState());

    }

    Future<void> _onSubmitWorkExperienceEvent(
        SubmitQualificationEvent event,
        Emitter<EditQualificationPageState> emit
        )async{

        emit(SubmitQualificationStatus()..dataState = DataState.loading);

        try{
            await submitRemoteQualificationAndExperienceUseCase.call(params: SubmitRemoteQualificationAndExperienceUseCaseParams(
                submitQualificationAndExperienceEntity: SubmitQualificationAndExperienceEntity(
                    otpQualificationEntityList: OTPQualificationListEntity(qualificationsEntityList: event.profileEntity.qualifications??[]),
                    otpWorKExperienceEntityList: OTPWorkExperienceListEntity(workExperience: event.profileEntity.workExperience??[]),)));
            emit(SubmitQualificationStatus()..dataState = DataState.success);

        }catch(ex){
            emit(SubmitQualificationStatus()..dataState = DataState.error);

        }

    }
} 
