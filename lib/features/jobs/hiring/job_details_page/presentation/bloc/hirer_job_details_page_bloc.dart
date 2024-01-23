import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:logger/logger.dart';

import '../../../../shared/domain/entities/create_job_page_job_entity.dart';

part 'hirer_job_details_page_event.dart';
part 'hirer_job_details_page_state.dart';

@injectable
class HirerJobDetailsPageBloc extends BaseBloc<ReviewJobEvent, HirerJobDetailsPageState> {bool preloaderActive = false;
  Logger logger = Logger();

  HirerJobDetailsPageBloc() : super(ReviewJobListingStatePageInitial()) {}

}
