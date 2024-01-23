import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';

part 'burger_menu_event.dart';
part 'burger_menu_state.dart';

@injectable
class BurgerMenuBloc
    extends BaseBloc<BurgerMenuPageEvent, BurgerMenuPageState> {

    List<bool> selectedToggleButtons = [true,false];

    BurgerMenuBloc(): super(BurgerMenuPageInitState()) {

        on<ToggleSelectedEvent>((event, emit) => _onToggleSelectedEvent(event, emit));

    }


    _onToggleSelectedEvent(
        ToggleSelectedEvent event,
        Emitter<BurgerMenuPageState> emit
        )async{
        // The button that is tapped is set to true, and the others to false.
        for (int i = 0; i < selectedToggleButtons.length; i++) {
            selectedToggleButtons[i] = i == event.selectedIndex;
        }

        emit(ToggleSelectedState()..dataState = DataState.success);

    }
} 
