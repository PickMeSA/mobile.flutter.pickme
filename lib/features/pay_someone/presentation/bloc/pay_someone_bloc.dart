import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'pay_someone_event.dart';
part 'pay_someone_state.dart';

@injectable
class PaySomeoneBloc
    extends BaseBloc<PaySomeonePageEvent, PaySomeonePageState> {
    PaySomeoneBloc(): super(PaySomeonePageInitState()) {}
} 
