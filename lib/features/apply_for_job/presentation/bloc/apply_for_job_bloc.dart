import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'apply_for_job_event.dart';
part 'apply_for_job_state.dart';

@injectable
class ApplyForJobBloc
    extends BaseBloc<ApplyForJobPageEvent, ApplyForJobPageState> {
    ApplyForJobBloc(): super(ApplyForJobPageInitState()) {}
} 
