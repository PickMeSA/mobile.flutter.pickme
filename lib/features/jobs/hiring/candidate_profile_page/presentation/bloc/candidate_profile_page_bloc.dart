import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';

import '../../../../shared/domain/entities/create_job_page_job_entity.dart';

part 'candidate_profile_page_event.dart';
part 'candidate_profile_page_state.dart';

@injectable
class CandidateProfilePageBloc extends BaseBloc<ReviewJobEvent, CandidateProfilePageState> {bool preloaderActive = false;
  Logger logger = Logger();

  CandidateProfilePageBloc() : super(CandidateProfileStatePageInitial()) {}

}
