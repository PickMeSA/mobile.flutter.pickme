import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'rate_and_work_times_event.dart';
part 'rate_and_work_times_state.dart';

@injectable
class RateAndWorkTimesBloc
    extends BaseBloc<RateAndWorkTimesPageEvent, RateAndWorkTimesPageState> {

    bool checked = false;
    RateAndWorkTimesBloc(): super(RateAndWorkTimesPageInitState()) {}
} 
