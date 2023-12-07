import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/location/domain/use_cases/location_usecase/location_remote_submit_location_usecase.dart';

import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

part 'location_event.dart';
part 'location_state.dart';

@injectable
class LocationBloc
    extends BaseBloc<LocationPageEvent, LocationPageState> {

    final LocationRemoteSubmitLocationUseCase locationRemoteSubmitLocationUseCase;

    bool checked = true;
    late String placeId;
    late OTPLocationEntity otpLocationEntity;
    bool preloaderActive = false;


    LocationBloc({required this.locationRemoteSubmitLocationUseCase}): super(LocationPageInitState()) {
      on<LocationSelectedEvent>((event, emit)=> _onLocationSelectedEvent(event, emit));
      on<LocationRemoteSubmitLocationEvent>((event, emit) => _onLocationRemoteSubmitLocation(event, emit));
    }

    Future<void> _onLocationRemoteSubmitLocation(
        LocationRemoteSubmitLocationEvent event,
        Emitter<LocationPageState> emit
        )async{
        emit(LocationRemoteSubmitLocationState()..dataState = DataState.loading);

        try{

            emit(LocationRemoteSubmitLocationState(profileEntity:
            await locationRemoteSubmitLocationUseCase.call
                (params: LocationRemoteSubmitLocationUseCaseParams(otpLocationEntity: otpLocationEntity))
            )..dataState = DataState.success);
        }catch(ex){
            emit(LocationRemoteSubmitLocationState(error: ex.toString())..dataState = DataState.error);
        }
    }

        Future<void> _onLocationSelectedEvent(
        LocationSelectedEvent event,
        Emitter<LocationPageState> emit
        )async{
            emit(LocationSelectedState()..dataState = DataState.loading);
            try{
                otpLocationEntity = event.otpLocationEntity!;
                checked = otpLocationEntity != null;
                emit(LocationSelectedState()..dataState = DataState.success);

            }catch(ex){
                emit(LocationSelectedState()..dataState = DataState.error);
            }
        }
} 
