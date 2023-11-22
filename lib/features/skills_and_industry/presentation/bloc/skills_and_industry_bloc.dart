import 'package:flutter/material.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'skills_and_industry_event.dart';
part 'skills_and_industry_state.dart';

@injectable
class SkillsAndIndustryBloc
    extends BaseBloc<SkillsAndIndustryPageEvent, SkillsAndIndustryPageState> {
    SkillsAndIndustryBloc(): super(SkillsAndIndustryPageInitState()) {}
} 
