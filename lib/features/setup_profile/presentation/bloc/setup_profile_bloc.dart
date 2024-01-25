import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/setup_profile/domain/entities/profile_type_entity.dart';
import 'package:pickme/features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart';
import 'package:pickme/features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_remote_submit_profile_type__usecase.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';

part 'setup_profile_event.dart';
part 'setup_profile_state.dart';

@injectable
class SetupProfileBloc
    extends BaseBloc<SetupProfilePageEvent, SetupProfilePageState> {

    List<bool> selectedToggleButtons = [true,false];
    ProfileModel profileModel= ProfileModel(
    workPermitNumber: '',
    idNumber: '',
    emailAddress: '',
    phoneNumber: '',
    surname: '',
    firstName: '',
    passportNumber: '');

    final SetupProfileGetLocalProfileUseCase setupProfileGetLocalProfileUseCase;
    final SetupProfileRemoteSubmitProfileTypeUseCase setupProfileRemoteSubmitProfileTypeUseCase;
    SetupProfileBloc({
        required this.setupProfileRemoteSubmitProfileTypeUseCase
    ,required this.setupProfileGetLocalProfileUseCase}
        ): super(SetupProfilePageInitState( profileModel: ProfileModel(
        workPermitNumber: '',
        idNumber: '',
        emailAddress: '',
        phoneNumber: '',
        surname: '',
        firstName: '',
        passportNumber: '')
    )..dataState = DataState.init) {
        on<SetUpProfileGetProfileEvent>((event, emit)=> _onSetUpProfileGetProfileEvent(event, emit));
        on<SetUpProfileToggleSelectedEvent>((event, emit) => _onSetUpProfileToggleSelectedEvent(event, emit));
        on<SetupProfileSubmitProfileTypeEvent>((event, emit) => _onSetupProfileSubmitProfileTypeEvent(event, emit));
    }

    _onSetupProfileSubmitProfileTypeEvent(
        SetupProfileSubmitProfileTypeEvent event,
        Emitter<SetupProfilePageState> emit
        ) async{
        try {
            String type= "";
            emit(SetupProfileSubmitProfileTypeState()
                ..dataState = DataState.loading);
            if(selectedToggleButtons[0] == true){
               type = 'work';
            }else{
                type = "hire";
            }
        await setupProfileRemoteSubmitProfileTypeUseCase.call(
            params: SetupProfileRemoteSubmitProfileTypeUseCaseParams(
                profileTypeEntity: ProfileTypeEntity(type:type )));

            emit(SetupProfileSubmitProfileTypeState()
                ..dataState = DataState.success);
    }catch(ex){
            emit(SetupProfileSubmitProfileTypeState()
                ..dataState = DataState.error);
        }

    }

    _onSetUpProfileToggleSelectedEvent(
        SetUpProfileToggleSelectedEvent event,
        Emitter<SetupProfilePageState> emit
        )async{
            // The button that is tapped is set to true, and the others to false.
        for (int i = 0; i < selectedToggleButtons.length; i++) {
            selectedToggleButtons[i] = i == event.selectedIndex;
        }

            emit(SetUpProfileToggleSelectedState(profileModel: profileModel!)..dataState = DataState.success);

    }

    _onSetUpProfileGetProfileEvent(SetUpProfileGetProfileEvent event,
        Emitter<SetupProfilePageState> emit) async{
        emit(SetUpProfileGetProfileState(profileModel: profileModel!)..dataState = DataState.loading);
        try{
            profileModel = await setupProfileGetLocalProfileUseCase.call();
            emit(SetUpProfileGetProfileState(profileModel: profileModel)..dataState = DataState.success);
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
