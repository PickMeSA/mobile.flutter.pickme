import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry.dart';
import 'package:pickme/features/add_skills/domain/entities/skill.dart';

part 'add_skills_event.dart';
part 'add_skills_state.dart';

@injectable
class AddSkillsBloc
    extends BaseBloc<AddSkillsPageEvent, AddSkillsPageState> {
    bool checked = false;
    List<ChipOption> chipOptions = [];
    List<DropdownMenuEntry<PreferredIndustry>> industryEntries
    = <DropdownMenuEntry<PreferredIndustry>>[];
    List<DropdownMenuEntry<Skill>> skillEntries = [];


    AddSkillsBloc(): super(AddSkillsPageInitState()) {

      //Hard coded values to be removed when backend integration is implemented.
            skillEntries.add(DropdownMenuEntry(value: Skill(id: 1, name: "Skill one"), label: "Skill one"));
            skillEntries.add(DropdownMenuEntry(value: Skill(id: 2, name: "Skill two"), label: "Skill two"));
            skillEntries.add(DropdownMenuEntry(value: Skill(id: 3, name: "Skill three"), label: "Skill three"));
            skillEntries.add(DropdownMenuEntry(value: Skill(id: 4, name: "Skill four"), label: "Skill four"));
            skillEntries.add(DropdownMenuEntry(value: Skill(id: 5, name: "Skill five"), label: "Skill five"));

            industryEntries.add(DropdownMenuEntry(value: PreferredIndustry(id: 1, name: "industry one"), label: "industry one"));
            industryEntries.add(DropdownMenuEntry(value: PreferredIndustry(id: 2, name: "industry two"), label: "industry two"));
            industryEntries.add(DropdownMenuEntry(value: PreferredIndustry(id: 3, name: "industry three"), label: "industry three"));
            industryEntries.add(DropdownMenuEntry(value: PreferredIndustry(id: 4, name: "industry four"), label: "industry four"));
            industryEntries.add(DropdownMenuEntry(value: PreferredIndustry(id: 5, name: "industry five"), label: "industry five"));
            emit(AddSkillsPageInitState());

            on<SkillSelectedEvent>((event, emit) => _onSkillSelectedEvent(event, emit));
            on<PreferredIndustrySelectedEvent>((event,emit)=> _onPreferredIndustrySelectedEvent(event, emit));
            on<SkillChipDeletedEvent>((event, emit) => _onSkillChipDeleteEvent(event, emit));
    }

    _onSkillChipDeleteEvent(
        SkillChipDeletedEvent event,
        Emitter<AddSkillsPageState> emit
        )async{
      chipOptions.removeAt(event.index);
      if(chipOptions.isEmpty){
        checked = false;
      }

      emit(SkillSelectedState());
    }


    _onSkillSelectedEvent(
        SkillSelectedEvent event,
        Emitter<AddSkillsPageState> emit
        )async{
      if(chipOptions.length < 5) {
        chipOptions.add(
            ChipOption(label: event.skill.name, id: event.skill.id));
      }
      checked = true;
      emit(SkillSelectedState());
      }

    _onPreferredIndustrySelectedEvent(
        PreferredIndustrySelectedEvent event,
        Emitter<AddSkillsPageState> emit
        )async{

    }

} 
