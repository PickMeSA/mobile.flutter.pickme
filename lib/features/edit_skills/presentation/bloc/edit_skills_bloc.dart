import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_list_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/skills_page_entity.dart';
import 'package:pickme/features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_skills_list_usecase.dart';
import 'package:pickme/features/add_skills/domain/use_cases/add_skills_usecase/add_skills_submit_remote_skills_and_industry_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

part 'edit_skills_event.dart';
part 'edit_skills_state.dart';

@injectable
class EditSkillsBloc
    extends BaseBloc<EditSkillsPageEvent, EditSkillsPageState> {

    bool preloaderActive = false;
    bool checked = false;
    List<ChipOption> chipOptions = [];
    late SkillListEntity selectedSkills = SkillListEntity(skillListEntity: []);
    late SkillListEntity skillListEntity = SkillListEntity(skillListEntity: []);
    List<DropdownMenuEntry<PreferredIndustryEntity>> industryEntries
    = <DropdownMenuEntry<PreferredIndustryEntity>>[];
    List<DropdownMenuEntry<SkillEntity>> skillEntries = [];
    final AddSkillsGetSkillsListUseCase addSkillsGetSkillsListUseCase;
    final AddSkillsSubmitRemoteSkillsAndIndustryUseCase addSkillsSubmitRemoteSkillsAndIndustryUseCase;
    EditSkillsBloc({required this.addSkillsSubmitRemoteSkillsAndIndustryUseCase,
        required this.addSkillsGetSkillsListUseCase}): super(EditSkillsPageInitState()) {
        on<EditSkillsGetSkillsListEvent>((event, emit)=> _onEditSkillsGetSkillsListEvent(event, emit));
        on<SkillChipDeletedEvent>((event,emit)=> _onSkillChipDeleteEvent(event,emit));
        on<SkillSelectedEvent>((event,emit)=> _onEditSkillSelectedEvent(event, emit));
        on<SubmitRemoteSkillsListEvent>((event, emit) => _SubmitRemoteSkillsListEvent(event,emit));
    }

    Future<void> _SubmitRemoteSkillsListEvent(
        SubmitRemoteSkillsListEvent event,
        Emitter<EditSkillsPageState> emit
        )async{
        emit(SubmitRemoteSkillsListState()..dataState = DataState.loading);
        try{

            emit(SubmitRemoteSkillsListState(profileEntity:
            await addSkillsSubmitRemoteSkillsAndIndustryUseCase(
                params : AddSkillsSubmitRemoteSkillsAndIndustryUseCaseParams(
                    skillsPageEntity: SkillsPageEntity(
                        skillListEntity: skillListEntity,
                        preferredIndustryEntity: PreferredIndustryEntity(
                            id: event.profileEntity?.industry?.id.toString()??"",
                            industry: event.profileEntity?.industry?.industry??""
                        )
                    )
                )))..dataState = DataState.success);
        }catch(ex){
            emit(SubmitRemoteSkillsListState(error: ex.toString())..dataState = DataState.error);
        }
    }

    Future <void> _onEditSkillsGetSkillsListEvent(
        EditSkillsGetSkillsListEvent event,
        Emitter<EditSkillsPageState> emit
        )async{

        emit(EditSkillsGetSkillsListState()..dataState = DataState.loading);
            try{
                event.profileEntity?.skills?.forEach((element) {
                   chipOptions.add(ChipOption(label: element.skill!, id: element.id!));
                });
                skillEntries.clear();
                SkillListEntity skillListEntity = await addSkillsGetSkillsListUseCase.call();
                skillListEntity.skillListEntity!.forEach((element) {
                    skillEntries.add(DropdownMenuEntry(value: element, label: element.skill!));
                });
                emit(EditSkillsGetSkillsListState()..dataState = DataState.success);

            }catch(ex){
                emit(EditSkillsGetSkillsListState(error: ex.toString())..dataState = DataState.error);

            }
    }


    Future<void> _onSkillChipDeleteEvent(
        SkillChipDeletedEvent event,
        Emitter<EditSkillsPageState> emit
        )async{
        chipOptions.removeAt(event.index);
        if(chipOptions.isEmpty){
            checked = false;
        }

        emit(SkillChipDeletedState()..dataState = DataState.success);
    }


    Future<void>_onEditSkillSelectedEvent(
        SkillSelectedEvent event,
        Emitter<EditSkillsPageState> emit
        )async{
        if(chipOptions.length < 5) {
            chipOptions.add(
                ChipOption(label: event.skill.skill!, id: int.parse(event.skill.id!)));
            selectedSkills.skillListEntity?.add(event.skill);
        }
        checked = true;
        emit(EditSkillSelectedState()..dataState = DataState.success);
    }



} 
