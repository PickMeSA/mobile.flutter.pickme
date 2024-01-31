import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'payment_outcome_event.dart';
part 'payment_outcome_state.dart';

@injectable
class PaymentOutcomeBloc
    extends BaseBloc<PaymentOutcomePageEvent, PaymentOutcomePageState> {
    PaymentOutcomeBloc(): super(PaymentOutcomePageInitState()) {}
} 
