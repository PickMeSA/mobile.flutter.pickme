import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

@injectable
class JobDetailsBloc
    extends BaseBloc<JobDetailsPageEvent, JobDetailsPageState> {
    JobDetailsBloc(): super(JobDetailsPageInitState()) {}
} 
