import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/location/domain/use_cases/location_usecase/location_get_current_location_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';

part 'location_event.dart';
part 'location_state.dart';

@injectable
class LocationBloc
    extends BaseBloc<LocationPageEvent, LocationPageState> {

    bool checked = true;

    final LocationGetCurrentLocationUseCase locationGetCurrentLocationUseCase;
    LocationBloc({
      required this.locationGetCurrentLocationUseCase
}): super(LocationPageInitState()) {

        on<GetLocalCurrentLocationEvent>((event, emit)=> _onGetLocalCurrentLocationEvent(event, emit));
    }

   Future<void> _onGetLocalCurrentLocationEvent(
        GetLocalCurrentLocationEvent event,
        Emitter<LocationPageState> emit)async{
        emit(GetLocalCurrentLocationState()..dataState = DataState.loading);
        try{
          emit(GetLocalCurrentLocationState(otpLocationEntity:  await locationGetCurrentLocationUseCase.call())..dataState = DataState.success);
        }catch(ex){
            emit(GetLocalCurrentLocationState(error: ex.toString())..dataState = DataState.error);
        }
   }
} 
