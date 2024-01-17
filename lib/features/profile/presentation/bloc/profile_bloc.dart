import 'package:flutter_bloc/flutter_bloc.dart';
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

        on<GetProfileDetailsEvent>((event, emit)=> _onGetProfileDetailsEvent(event, emit));
    }

    late ProfileEntity profileEntity;



    Future<void> _onGetProfileDetailsEvent(
        GetProfileDetailsEvent event,
        Emitter<ProfilePageState> emit
        )async{
        emit(GetProfileDetailsState()..dataState = DataState.loading);
        try{
            profileEntity = await getRemoteProfileUseCase.call();
            emit(GetProfileDetailsState()..dataState = DataState.success);
        }catch(ex){
            emit(GetProfileDetailsState(error:ex.toString())..dataState = DataState.error);
        }
    }
} 
