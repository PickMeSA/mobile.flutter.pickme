import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'offer_sent_event.dart';
part 'offer_sent_state.dart';

@injectable
class OfferSentPageBloc
    extends BaseBloc<YouAreAllSetupPageEvent, OfferSentPageState> {
    OfferSentPageBloc(): super(YouAreAllSetupPageInitState()) {}
} 
