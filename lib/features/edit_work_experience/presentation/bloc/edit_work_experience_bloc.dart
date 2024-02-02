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

part 'edit_work_experience_event.dart';
part 'edit_work_experience_state.dart';

@injectable
class EditWorkExperienceBloc
    extends BaseBloc<EditWorkExperiencePageEvent, EditWorkExperiencePageState> {

    final SubmitRemoteQualificationAndExperienceUseCase submitRemoteQualificationAndExperienceUseCase;
    EditWorkExperienceBloc({required this.submitRemoteQualificationAndExperienceUseCase}): super(EditWorkExperiencePageInitState()) {
        on<EditWorkExperienceAddWorkEvent>((event, emit)=> _onEditWorkExperienceAddWorkEvent(event, emit));
        on<SubmitWorkExperienceEvent>((event,emit)=> _onSubmitWorkExperienceEvent(event, emit));
        on<UpdateUIEvent>((event, emit)=> _onUpdateUIEvent(event,emit));
    }

   Future<void> _onEditWorkExperienceAddWorkEvent(
        EditWorkExperienceAddWorkEvent event,
        Emitter<EditWorkExperiencePageState> emit
        )async{
        emit(EditWorkExperienceAddWorkState());
    }

    Future<void> _onSubmitWorkExperienceEvent(
        SubmitWorkExperienceEvent event,
        Emitter<EditWorkExperiencePageState> emit
        )async{

        emit(SubmitWorkExperienceState()..dataState = DataState.loading);

        try{
            await submitRemoteQualificationAndExperienceUseCase.call(params: SubmitRemoteQualificationAndExperienceUseCaseParams(
                submitQualificationAndExperienceEntity: SubmitQualificationAndExperienceEntity(
                    otpQualificationEntityList: OTPQualificationListEntity(qualificationsEntityList: event.profileEntity.qualifications??[]),
                    otpWorKExperienceEntityList: OTPWorkExperienceListEntity(workExperience: event.profileEntity.workExperience??[]),)));
            emit(SubmitWorkExperienceState()..dataState = DataState.success);

        }catch(ex){
            emit(SubmitWorkExperienceState(error: ex.toString())..dataState = DataState.error);

        }

    }

    Future<void> _onUpdateUIEvent(
        UpdateUIEvent event,
        Emitter<EditWorkExperiencePageState> emit
        )async{
      emit(UpdateUIState()..dataState = DataState.success);
    }

} 
