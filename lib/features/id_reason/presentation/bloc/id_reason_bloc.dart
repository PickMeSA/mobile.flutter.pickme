import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'id_reason_event.dart';
part 'id_reason_state.dart';

@injectable
class IdReasonBloc
    extends BaseBloc<IdReasonPageEvent, IdReasonPageState> {
    IdReasonBloc(): super(IdReasonPageInitState()) {}
} 
