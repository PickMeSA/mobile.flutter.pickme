import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cancellation_details_event.dart';
part 'cancellation_details_state.dart';

@injectable
class CancellationDetailsBloc
    extends BaseBloc<CancellationDetailsPageEvent, CancellationDetailsPageState> {
    CancellationDetailsBloc(): super(CancellationDetailsPageInitState()) {}
} 
