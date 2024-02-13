import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/add_skills/domain/entities/prefered_industry_list_entity.dart';
import 'package:pickme/features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart';
import '../../../add_skills/domain/entities/preferred_industry_entity.dart';

part 'edit_work_experience_details_event.dart';
part 'edit_work_experience_details_state.dart';

@injectable
class EditWorkExperienceDetailsBloc
    extends BaseBloc<EditWorkExperienceDetailsPageEvent, EditWorkExperienceDetailsPageState> {

    bool current = false;
    List<DropdownMenuEntry<PreferredIndustryEntity>> industryEntries
    = <DropdownMenuEntry<PreferredIndustryEntity>>[];
    late PreferredIndustryListEntity preferredIndustryListEntity = PreferredIndustryListEntity(preferredIndustryListEntity: []);
     PreferredIndustryEntity? selectedIndustry;
    final AddSkillsGetIndustryListUseCase addSkillsGetIndustryListUseCase;

    EditWorkExperienceDetailsBloc({required this.addSkillsGetIndustryListUseCase}): super(EditWorkExperienceDetailsPageInitState()) {
        on<AddWorkExperienceCurrentSelectedEvent>((event, emit)=> _onAddWorkExperienceCurrentSelectedEvent(event, emit));
        on<AddWorkExperienceGetPreferredIndustryListEvent>((event, emit) => _onAddWorkGetPreferredIndustryListEvent(event, emit));
        on<PreferredIndustrySelectedEvent>((event, emit) => _onPreferredIndustrySelectedEvent(event,emit));
        on<RefreshImagesEvent>((event, emit) => _onRefreshImagesEvent(event,emit));
    }

    _onRefreshImagesEvent(
        RefreshImagesEvent event,
        Emitter<EditWorkExperienceDetailsPageState> emit
        ){
        emit(RefreshImagesState()..dataState = DataState.success);
}

    _onAddWorkExperienceCurrentSelectedEvent(
        AddWorkExperienceCurrentSelectedEvent event,
        Emitter<EditWorkExperienceDetailsPageState> emit
        ) async{

        current = !current;
        emit(AddWorkExperienceCurrentSelectedState());

    }

    _onAddWorkGetPreferredIndustryListEvent(
        AddWorkExperienceGetPreferredIndustryListEvent event,
        Emitter<EditWorkExperienceDetailsPageState> emit
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
        Emitter<EditWorkExperienceDetailsPageState> emit
        )async{
        selectedIndustry = event.preferredIndustry;
    }



} 
