import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'apply_for_job_tool_tip_event.dart';
part 'apply_for_job_tool_tip_state.dart';

@injectable
class ApplyForJobToolTipBloc
    extends BaseBloc<ApplyForJobToolTipPageEvent, ApplyForJobToolTipPageState> {
    ApplyForJobToolTipBloc(): super(ApplyForJobToolTipPageInitState()) {}
} 
