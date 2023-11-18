part of 'qualification_bloc.dart';
@immutable
abstract class QualificationsPageState extends BaseState {
  bool checked;

  QualificationsPageState({ required this.checked});
}

class QualificationsPageInitState extends QualificationsPageState  {

  QualificationsPageInitState({required super.checked});
}

