import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'reschedule_request_event.dart';
part 'reschedule_request_state.dart';

@injectable
class RescheduleRequestBloc
    extends BaseBloc<RescheduleRequestPageEvent, RescheduleRequestPageState> {
    RescheduleRequestBloc(): super(RescheduleRequestPageInitState()) {}
} 
