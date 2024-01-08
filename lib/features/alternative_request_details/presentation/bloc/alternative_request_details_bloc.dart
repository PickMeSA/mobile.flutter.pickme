import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'alternative_request_details_event.dart';
part 'alternative_request_details_state.dart';

@injectable
class AlternativeRequestDetailsBloc
    extends BaseBloc<AlternativeRequestDetailsPageEvent, AlternativeRequestDetailsPageState> {
    AlternativeRequestDetailsBloc(): super(AlternativeRequestDetailsPageInitState()) {}
} 
