import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/lets_begin/domain/entites/lets_begin_entity.dart';

part 'lets_begin_event.dart';
part 'lets_begin_state.dart';

@injectable
class LetsBeginBloc
    extends BaseBloc<LetsBeginPageEvent, LetsBeginPageState> {

    bool checked = false;
    int index = 0;

    LetsBeginBloc(): super(LetsBeginPageInitState()) {

        on<ValueChangedEvent>((event, emit) => _onValueChangedEvent( event, emit));
    }

    _onValueChangedEvent(
        ValueChangedEvent event,
        Emitter<LetsBeginPageState> emit
        ) async{
        checked = false;
        if(
        event.letsBeginEntity.email!.isNotEmpty&&
            event.letsBeginEntity.password!.isNotEmpty&&
            event.letsBeginEntity.confirmPassword!.isNotEmpty
        ){
          checked = true;

            emit(ValueChangedState());
        }
    }
} 
