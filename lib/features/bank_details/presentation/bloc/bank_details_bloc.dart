import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'bank_details_event.dart';
part 'bank_details_state.dart';

@injectable
class BankDetailsBloc
    extends BaseBloc<BankDetailsPageEvent, BankDetailsPageState> {
    BankDetailsBloc(): super(BankDetailsPageInitState()) {}
} 
