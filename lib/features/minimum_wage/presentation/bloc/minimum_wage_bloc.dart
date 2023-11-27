import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'minimum_wage_event.dart';
part 'minimum_wage_state.dart';

@injectable
class MinimumWageBloc
    extends BaseBloc<MinimumWagePageEvent, MinimumWagePageState> {
    MinimumWageBloc(): super(MinimumWagePageInitState()) {}
} 
