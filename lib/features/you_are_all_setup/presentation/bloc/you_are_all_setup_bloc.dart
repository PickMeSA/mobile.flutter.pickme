import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'you_are_all_setup_event.dart';
part 'you_are_all_setup_state.dart';

@injectable
class YouAreAllSetupBloc
    extends BaseBloc<YouAreAllSetupPageEvent, YouAreAllSetupPageState> {
    YouAreAllSetupBloc(): super(YouAreAllSetupPageInitState()) {}
} 
