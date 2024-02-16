import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'verify_its_you_event.dart';
part 'verify_its_you_state.dart';

@injectable
class VerifyItsYouBloc
    extends BaseBloc<VerifyItsYouPageEvent, VerifyItsYouPageState> {
    VerifyItsYouBloc(): super(VerifyItsYouPageInitState()) {}
} 
