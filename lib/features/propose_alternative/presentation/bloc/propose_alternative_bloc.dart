import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'propose_alternative_event.dart';
part 'propose_alternative_state.dart';

@injectable
class ProposeAlternativeBloc


    extends BaseBloc<ProposeAlternativePageEvent, ProposeAlternativePageState> {

    bool checked = false;

    ProposeAlternativeBloc(): super(ProposeAlternativePageInitState()) {}
} 
