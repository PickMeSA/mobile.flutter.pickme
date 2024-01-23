import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'add_memberships_event.dart';
part 'add_memberships_state.dart';

@injectable
class AddMembershipsBloc
    extends BaseBloc<AddMembershipsPageEvent, AddMembershipsPageState> {
    AddMembershipsBloc(): super(AddMembershipsPageInitState()) {}
} 
