import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

@injectable
class BottomNavigationBarBloc
    extends BaseBloc<BottomNavigationBarPageEvent, BottomNavigationBarPageState> {
    final GetRemoteProfileUseCase getRemoteProfileUseCase;
    BottomNavigationBarBloc({required this.getRemoteProfileUseCase}):
            super(BottomNavigationBarPageInitState()) {
        on<GetProfileDetailsEvent>((event, emit)=> _onGetProfileDetailsEvent(event, emit));
    }

    Future<void> _onGetProfileDetailsEvent(
        GetProfileDetailsEvent event,
        Emitter<BottomNavigationBarPageState> emit
        )async{
        emit(GetProfileDetailsState()..dataState = DataState.loading);

        try{

            UserModel userModel = boxUser.get(current);
            this.profileEntity!.userId = userModel.id;
            ProfileEntity profileEntity = await getRemoteProfileUseCase.call();
            this.profileEntity = profileEntity;
            emit(GetProfileDetailsState(
                profileEntity: profileEntity
            )..dataState = DataState.success);


        }catch(ex){
            emit(GetProfileDetailsState(error: ex.toString())..dataState = DataState.error);
        }
    }
} 
