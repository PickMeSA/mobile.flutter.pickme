import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'add_work_experience_event.dart';
part 'add_work_experience_state.dart';

@injectable
class AddWorkExperienceBloc
    extends BaseBloc<AddWorkExperiencePageEvent, AddWorkExperiencePageState> {
    AddWorkExperienceBloc(): super(AddWorkExperiencePageInitState()) {}
} 
