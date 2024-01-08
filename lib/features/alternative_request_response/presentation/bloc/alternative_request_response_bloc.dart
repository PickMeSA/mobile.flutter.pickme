import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'alternative_request_response_event.dart';
part 'alternative_request_response_state.dart';

@injectable
class AlternativeRequestResponseBloc
    extends BaseBloc<AlternativeRequestResponsePageEvent, AlternativeRequestResponsePageState> {
    AlternativeRequestResponseBloc(): super(AlternativeRequestResponsePageInitState()) {}
} 
