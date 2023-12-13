import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

@injectable
class BottomNavigationBarBloc
    extends BaseBloc<BottomNavigationBarPageEvent, BottomNavigationBarPageState> {
    BottomNavigationBarBloc(): super(BottomNavigationBarPageInitState()) {}
} 
