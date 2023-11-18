import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'qualification_event.dart';
part 'qualification_state.dart';

@injectable
class QualificationsBloc
    extends BaseBloc<QualificationsPageEvent, QualificationsPageState> {
    QualificationsBloc(): super(QualificationsPageInitState(checked: true)) {}
} 
