import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc
    extends BaseBloc<ProfilePageEvent, ProfilePageState> {

    final GetRemoteProfileUseCase getRemoteProfileUseCase;
    ProfileBloc({required this.getRemoteProfileUseCase}): super(ProfilePageInitState()) {
        on<UpdateUIEvent>((event, emit)=> _onUpdateUIEvent(event,emit));
        on<GetProfileDetailsEvent>((event, emit)=> _onGetProfileDetailsEvent(event, emit));
    }

     late ProfileEntity profileEntity ;
    late List<ChipOption> skills;

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
            profileEntity.skills!.forEach((element) {
                skills.add(ChipOption(label: element.skill!, id: element.id!));
            });
            emit(GetProfileDetailsState()..dataState = DataState.success);
        }catch(ex){
            emit(GetProfileDetailsState(error:ex.toString())..dataState = DataState.error);
        }
    }
} 
