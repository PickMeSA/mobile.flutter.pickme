import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';

part 'qualification_event.dart';
part 'qualification_state.dart';

@injectable
class QualificationsBloc
    extends BaseBloc<QualificationsPageEvent, QualificationsPageState> {


    List<OTPQualificationEntity> otpQualificationEntityList = [];
    List<OTPWorkExperienceEntity> otpWorKExperienceEntityList = [];
    QualificationsBloc(): super(QualificationsPageInitState()) {
        on<AddQualificationEvent>((event, emit)=> _onAddQualificationEvent(event, emit));
    }

    _onAddQualificationEvent(
        AddQualificationEvent event,
        Emitter<QualificationsPageState> emit)async{
        otpQualificationEntityList.add(event.otpQualificationEntity);
        emit(AddQualificationState());
    }
} 
