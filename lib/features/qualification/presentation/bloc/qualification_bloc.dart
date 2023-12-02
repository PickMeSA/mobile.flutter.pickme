import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/qualification/domain/entities/submit_qualification_and_experience_entity.dart';
import 'package:pickme/features/qualification/domain/use_cases/qualification_usecase/submit_remote_qualifications_and_experience_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experience_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

part 'qualification_event.dart';
part 'qualification_state.dart';

@injectable
class QualificationsBloc
    extends BaseBloc<QualificationsPageEvent, QualificationsPageState> {

    bool? preloaderActive;
    List<OTPQualificationEntity> otpQualificationEntityList = [];
    List<OTPWorkExperienceEntity> otpWorKExperienceEntityList = [];
    SubmitRemoteQualificationAndExperienceUseCase submitRemoteQualificationAndExperienceUseCase;
    QualificationsBloc(
    {required this.submitRemoteQualificationAndExperienceUseCase}
        ): super(QualificationsPageInitState()) {
        on<AddQualificationRemoteSubmitEvent>((event, emit) => _onAddQualificationRemoteSubmitEvent(event, emit));
        on<AddQualificationEvent>((event, emit)=> _onAddQualificationEvent(event, emit));
        on<AddWorkExperienceEvent>((event, emit) => _onAddWorkExperienceEvent(event,emit));
    }

    _onAddQualificationRemoteSubmitEvent(
        AddQualificationRemoteSubmitEvent event,
        Emitter<QualificationsPageState> emit
        )async{
        emit(AddQualificationRemoteSubmitState()..dataState = DataState.loading);

        try{
            emit(AddQualificationRemoteSubmitState(
                profileEntity: await submitRemoteQualificationAndExperienceUseCase.call(
                params: SubmitRemoteQualificationAndExperienceUseCaseParams(
                    submitQualificationAndExperienceEntity: SubmitQualificationAndExperienceEntity(
                        otpQualificationEntityList: OTPQualificationListEntity(qualifications: otpQualificationEntityList),
                        otpWorKExperienceEntityList: OTPWorkExperienceListEntity(workExperience: otpWorKExperienceEntityList)
                    )) ))..dataState = DataState.success
            );
        }catch(ex){
            emit(AddQualificationRemoteSubmitState(error: ex.toString())..dataState = DataState.error);
        }
    }

    _onAddQualificationEvent(
        AddQualificationEvent event,
        Emitter<QualificationsPageState> emit)async{
        otpQualificationEntityList.add(event.otpQualificationEntity);
        emit(AddQualificationState());
    }

    _onAddWorkExperienceEvent(
        AddWorkExperienceEvent event,
        Emitter<QualificationsPageState> emit) async{
        otpWorKExperienceEntityList.add(event.otpWorkExperienceEntity);
        emit(AddWorkExperienceState());
    }

} 
