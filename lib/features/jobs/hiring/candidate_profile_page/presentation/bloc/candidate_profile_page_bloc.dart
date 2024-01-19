import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';
import 'package:pickme/features/jobs/hiring/candidate_profile_page/domain/usecases/get_candidate_profile_use_case.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

import '../../../../shared/domain/entities/create_job_page_job_entity.dart';

part 'candidate_profile_page_event.dart';
part 'candidate_profile_page_state.dart';

@injectable
class CandidateProfilePageBloc extends BaseBloc<CandidateProfilePageEvent, CandidateProfilePageState> {
  bool preloaderActive = false;
  Logger logger = Logger();
  ProfileEntity? candidateProfile;
  GetCandidateProfileUseCase getCandidateProfileUseCase;
  CandidateProfilePageBloc({required this.getCandidateProfileUseCase}) : super(CandidateProfileStatePageInitial()) {
on<CandidateProfilePageEnteredEvent>((event, emit) => _onCandidateProfilePageEnteredEvent(event, emit));
}
_onCandidateProfilePageEnteredEvent(CandidateProfilePageEnteredEvent event,
    Emitter<CandidateProfilePageState> emit) async{
  emit(CandidateProfilePageEnteredState()..dataState=DataState.loading);
  try{
    candidateProfile = await getCandidateProfileUseCase.call(params: GetCandidateProfileUseCaseParams(id: event.candidateProfile.id));
    emit(CandidateProfilePageEnteredState()..dataState=DataState.success);
  }catch(ex){
    emit(CandidateProfilePageEnteredState()..dataState=DataState.error);
    logger.e(ex);
  }
}
}
