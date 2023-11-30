import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'final_details_event.dart';
part 'final_details_state.dart';

@injectable
class FinalDetailsBloc
    extends BaseBloc<FinalDetailsPageEvent, FinalDetailsPageState> {
    bool checked = true;
    FinalDetailsBloc(): super(FinalDetailsPageInitState()) {}
} 
