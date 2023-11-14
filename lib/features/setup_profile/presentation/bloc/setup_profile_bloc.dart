import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';

part 'setup_profile_event.dart';
part 'setup_profile_state.dart';

@injectable
class SetupProfileBloc
    extends BaseBloc<SetupProfilePageEvent, SetupProfilePageState> {

    final SetupProfileGetLocalProfileUseCase setupProfileGetLocalProfileUseCase;
    SetupProfileBloc({required this.setupProfileGetLocalProfileUseCase}
        ): super(SetupProfilePageInitState( profileModel: ProfileModel(
        workPermitNumber: '',
        idNumber: '',
        emailAddress: '',
        phoneNumber: '',
        surname: '',
        firstName: '',
        passportNumber: '')
    )) {
        on<SetUpProfileGetProfileEvent>((event, emit)=> _onSetUpProfileGetProfileEvent(event, emit));
    }

    _onSetUpProfileGetProfileEvent(SetUpProfileGetProfileEvent event,
        Emitter<SetupProfilePageState> emit) async{
        emit(SetUpProfileGetProfileState()..dataState = DataState.success);

        try{
            emit(SetUpProfileGetProfileState(
                profileModel: await setupProfileGetLocalProfileUseCase.call())..dataState = DataState.success);
        }catch(ex){
            emit(SetUpProfileGetProfileState(profileModel: ProfileModel(
                workPermitNumber: '',
                idNumber: '',
                emailAddress: '',
                phoneNumber: '',
                surname: '',
                firstName: '',
                passportNumber: ''))..dataState = DataState.error);
        }

    }
} 
