import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'alternative_sent_event.dart';
part 'alternative_sent_state.dart';

@injectable
class AlternativeSentBloc
    extends BaseBloc<AlternativeSentPageEvent, AlternativeSentPageState> {
    AlternativeSentBloc(): super(AlternativeSentPageInitState()) {}
} 
