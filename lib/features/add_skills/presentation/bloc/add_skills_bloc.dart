import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry.dart';

part 'add_skills_event.dart';
part 'add_skills_state.dart';

@injectable
class AddSkillsBloc
    extends BaseBloc<AddSkillsPageEvent, AddSkillsPageState> {
    bool checked = false;
    List<ChipOption> chipOptions = [];
    List<DropdownMenuEntry<PreferredIndustry>> industryEntries
    = <DropdownMenuEntry<PreferredIndustry>>[];
    List<DropdownMenuEntry<String>> skillEntries = [];


    AddSkillsBloc(): super(AddSkillsPageInitState(checked: false)) {

    }

} 
