import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'application_sent_event.dart';
part 'application_sent_state.dart';

@injectable
class ReusableNotificationPageBloc
    extends BaseBloc<ApplicationSentPageEvent, OfferAcceptedPageState> {
    ReusableNotificationPageBloc(): super(ApplicationSentPageInitState()) {}
} 
