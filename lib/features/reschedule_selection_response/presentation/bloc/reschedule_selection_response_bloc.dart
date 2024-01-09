import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'reschedule_selection_response_event.dart';
part 'reschedule_selection_response_state.dart';

@injectable
class RescheduleSelectionResponseBloc
    extends BaseBloc<RescheduleSelectionResponsePageEvent, RescheduleSelectionResponsePageState> {
    RescheduleSelectionResponseBloc(): super(RescheduleSelectionResponsePageInitState()) {}
} 
