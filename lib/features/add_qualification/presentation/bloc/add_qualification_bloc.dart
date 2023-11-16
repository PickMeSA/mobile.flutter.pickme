import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/constants/qualifications.dart';

part 'add_qualification_event.dart';
part 'add_qualification_state.dart';

@injectable
class AddQualificationBloc
    extends BaseBloc<AddQualificationPageEvent, AddQualificationPageState> {
    AddQualificationBloc(): super(AddQualificationPageInitState()) {
        on<GetPageInformationEvent>((event, emit)=> onGetPageInformationEvent(event,emit));
    }

    onGetPageInformationEvent(GetPageInformationEvent event,
        Emitter<AddQualificationPageState> emit){
        List<DropdownMenuEntry<Qualifications>> qualificationEntries = [];
        for (Qualifications qualification in qualificationList){
            qualificationEntries.add(DropdownMenuEntry(value: qualification, label: qualification.name));
        }
        emit(GetPageInformationState(entries: qualificationEntries));
    }
} 
