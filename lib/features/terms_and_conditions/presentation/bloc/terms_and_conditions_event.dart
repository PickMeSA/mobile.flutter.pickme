part of 'terms_and_conditions_bloc.dart';

@immutable
abstract class TermsAndConditionsEvent extends BaseEvent {}


class GetRemoteTermsAndConditionsEvent extends TermsAndConditionsEvent{}

class SubmitTermsAndConditionsAcceptanceEvent extends TermsAndConditionsEvent{}