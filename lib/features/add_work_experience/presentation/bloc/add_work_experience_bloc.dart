import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/add_skills/domain/entities/prefered_industry_list_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart';

part 'add_work_experience_event.dart';
part 'add_work_experience_state.dart';

@injectable
class AddWorkExperienceBloc
    extends BaseBloc<AddWorkExperiencePageEvent, AddWorkExperiencePageState> {

    bool current = false;
    List<DropdownMenuEntry<PreferredIndustryEntity>> industryEntries
    = <DropdownMenuEntry<PreferredIndustryEntity>>[];
    late PreferredIndustryListEntity preferredIndustryListEntity;
    late PreferredIndustryEntity selectedIndustry;
    final AddSkillsGetIndustryListUseCase addSkillsGetIndustryListUseCase;
    AddWorkExperienceBloc({required this.addSkillsGetIndustryListUseCase}): super(AddWorkExperiencePageInitState()) {
        on<AddWorkExperienceCurrentSelectedEvent>((event, emit)=> _onAddWorkExperienceCurrentSelectedEvent(event, emit));
        on<AddWorkExperienceGetPreferredIndustryListEvent>((event, emit) => _onAddWorkGetPreferredIndustryListEvent(event, emit));
        on<PreferredIndustrySelectedEvent>((event, emit) => _onPreferredIndustrySelectedEvent(event,emit));
    }

    _onAddWorkExperienceCurrentSelectedEvent(
        AddWorkExperienceCurrentSelectedEvent event,
        Emitter<AddWorkExperiencePageState> emit
        ) async{

        current = !current;
        emit(AddWorkExperienceCurrentSelectedState());

    }

    _onAddWorkGetPreferredIndustryListEvent(
        AddWorkExperienceGetPreferredIndustryListEvent event,
        Emitter<AddWorkExperiencePageState> emit
        )async{
        emit(AddWorkGetPreferredIndustryListState()..dataState = DataState.loading);
        try{
            industryEntries.clear();
            preferredIndustryListEntity = await addSkillsGetIndustryListUseCase.call();
            preferredIndustryListEntity.preferredIndustryListEntity!.forEach((element) {
                industryEntries.add(DropdownMenuEntry(value: element, label: element.industry!));
            });

            emit(AddWorkGetPreferredIndustryListState()..dataState = DataState.success);
        }catch(ex){
            emit(AddWorkGetPreferredIndustryListState(error: ex.toString())..dataState = DataState.loading);
        }
    }

    _onPreferredIndustrySelectedEvent(
        PreferredIndustrySelectedEvent event,
        Emitter<AddWorkExperiencePageState> emit
        )async{
        selectedIndustry = event.preferredIndustry;
    }


} 
