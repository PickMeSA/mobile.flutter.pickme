import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

@injectable
class LocationBloc
    extends BaseBloc<LocationPageEvent, LocationPageState> {

    bool checked = true;
    LocationBloc(): super(LocationPageInitState()) {}
} 
