import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/add_skills/domain/entities/prefered_industry_list_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/skills_page_entity.dart';
import 'package:pickme/features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart';
import 'package:pickme/features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_skills_list_usecase.dart';
import 'package:pickme/features/add_skills/domain/use_cases/add_skills_usecase/add_skills_submit_remote_skills_and_industry_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

part 'add_skills_event.dart';
part 'add_skills_state.dart';

@injectable
class AddSkillsBloc
    extends BaseBloc<AddSkillsPageEvent, AddSkillsPageState> {
    bool preloaderActive = false;
    bool checked = false;
    List<ChipOption> chipOptions = [];
    List<DropdownMenuEntry<PreferredIndustryEntity>> industryEntries
    = <DropdownMenuEntry<PreferredIndustryEntity>>[];
    List<DropdownMenuEntry<SkillEntity>> skillEntries = [];
    late PreferredIndustryListEntity preferredIndustryListEntity;
    late PreferredIndustryEntity selectedIndustry;
    late SkillListEntity selectedSkills = SkillListEntity(skillListEntity: []);
    final AddSkillsGetIndustryListUseCase addSkillsGetIndustryListUseCase;
    final AddSkillsGetSkillsListUseCase addSkillsGetSkillsListUseCase;
    final AddSkillsSubmitRemoteSkillsAndIndustryUseCase addSkillsSubmitRemoteSkillsAndIndustryUseCase;


    AddSkillsBloc({
      required this.addSkillsGetIndustryListUseCase,
      required this.addSkillsGetSkillsListUseCase,
      required this.addSkillsSubmitRemoteSkillsAndIndustryUseCase
}): super(AddSkillsPageInitState()) {
            industryEntries.add(DropdownMenuEntry(value: PreferredIndustryEntity(id: "0", industry: "Preferred Industry"), label: "Preferred Industry"));
      //Hard coded values to be removed when backend integration is implemented.
            skillEntries.add(DropdownMenuEntry(value: SkillEntity(id: "0", skill: "Skill"), label: "Skill"));


            emit(AddSkillsPageInitState());

            on<SkillSelectedEvent>((event, emit) => _onSkillSelectedEvent(event, emit));
            on<PreferredIndustrySelectedEvent>((event,emit)=> _onPreferredIndustrySelectedEvent(event, emit));
            on<SkillChipDeletedEvent>((event, emit) => _onSkillChipDeleteEvent(event, emit));
            on<AddSkillsGetPreferredIndustryListEvent>((event, emit)=> _onAddSkillsGetPreferredIndustryListEvent(event, emit));
            on<AddSkillGetSkillsListEvent>((event, emit) => _onAddSkillsGetSkillsListEvent(event, emit));
            on<AddSkillSubmitRemoteSkillsAndIndustryEvent>((event ,emit) => _onAddSkillSubmitRemoteSkillsAndIndustryEvent(event, emit));
    }

    _onAddSkillSubmitRemoteSkillsAndIndustryEvent(
        AddSkillSubmitRemoteSkillsAndIndustryEvent event,
        Emitter<AddSkillsPageState> emit
        )async{
      emit(AddSkillSubmitRemoteSkillsAndIndustryState()..dataState = DataState.loading);
      try{
        emit(AddSkillSubmitRemoteSkillsAndIndustryState(
          profileEntity: await addSkillsSubmitRemoteSkillsAndIndustryUseCase.call(
            params: AddSkillsSubmitRemoteSkillsAndIndustryUseCaseParams(
                skillsPageEntity: SkillsPageEntity(
                    skillListEntity:selectedSkills ,
                    preferredIndustryEntity: selectedIndustry ))
          )
        )..dataState = DataState.success);
      }catch(ex){
        emit(AddSkillSubmitRemoteSkillsAndIndustryState(error: ex.toString())..dataState = DataState.error);
      }
    }

    _onAddSkillsGetSkillsListEvent(
        AddSkillGetSkillsListEvent event,
        Emitter<AddSkillsPageState> emit

        )async{
      emit(AddSkillGetSkillsListState()..dataState = DataState.loading);
      try{
        skillEntries.clear();
        SkillListEntity skillListEntity = await addSkillsGetSkillsListUseCase.call();
        skillListEntity.skillListEntity!.forEach((element) {
          skillEntries.add(DropdownMenuEntry(value: element, label: element.skill!));
        });
        emit(AddSkillGetSkillsListState()..dataState = DataState.success);
      }catch(ex){
        emit(AddSkillGetSkillsListState(error: ex.toString())..dataState = DataState.error);
      }
    }

    _onAddSkillsGetPreferredIndustryListEvent(
        AddSkillsGetPreferredIndustryListEvent event,
        Emitter<AddSkillsPageState> emit
        )async{
          emit(AddSkillsGetPreferredIndustryListState()..dataState = DataState.loading);
          try{
            industryEntries.clear();
            preferredIndustryListEntity = await addSkillsGetIndustryListUseCase.call();
            preferredIndustryListEntity.preferredIndustryListEntity!.forEach((element) {
              industryEntries.add(DropdownMenuEntry(value: element, label: element.industry!));
            });

            emit(AddSkillsGetPreferredIndustryListState()..dataState = DataState.success);
          }catch(ex){
            emit(AddSkillsGetPreferredIndustryListState(error: ex.toString())..dataState = DataState.loading);
          }
    }

    _onSkillChipDeleteEvent(
        SkillChipDeletedEvent event,
        Emitter<AddSkillsPageState> emit
        )async{
      chipOptions.removeAt(event.index);
      if(chipOptions.isEmpty){
        checked = false;
      }

      emit(AddSkillGetSkillsListState()..dataState = DataState.success);
    }


    _onSkillSelectedEvent(
        SkillSelectedEvent event,
        Emitter<AddSkillsPageState> emit
        )async{
      if(chipOptions.length < 5) {
        chipOptions.add(
            ChipOption(label: event.skill.skill!, id: int.parse(event.skill.id!)));
        selectedSkills.skillListEntity?.add(event.skill);
      }
      checked = true;
      emit(AddSkillGetSkillsListState()..dataState = DataState.success);
      }

    _onPreferredIndustrySelectedEvent(
        PreferredIndustrySelectedEvent event,
        Emitter<AddSkillsPageState> emit
        )async{
      selectedIndustry = event.preferredIndustry;
    }

} 
