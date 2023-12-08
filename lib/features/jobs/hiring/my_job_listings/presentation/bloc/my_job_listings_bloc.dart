import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/shared/domain/entities/paginated_industry_object.dart';
import 'package:logger/logger.dart';

import '../../domain/use_cases/otp_usecase/get_my_job_listings_usecase.dart';
part 'my_job_listings_event.dart';
part 'my_job_listings_state.dart';

@injectable
class MyJobListingsBloc extends BaseBloc<MyJobListingsEvent, MyJobListingsState> {
  final GetMyJobListingsUseCase getIndustriesUseCase;
  PaginatedIndustryEntity? paginatedIndustries;
  int selectedTabIndex = 0;
  Logger logger = Logger();

  MyJobListingsBloc({required this.getIndustriesUseCase}) : super(MyJobListingsPageInitial(selectedTabIndex: 0)) {
    on<MyJobListingsPageEnteredEvent>((event, emit) => _onMyJobListingsPageEnteredEvent(event, emit));
    on<SelectedTabChangedEvent>((event, emit) => _onSelectedTabChangedEvent(event, emit));
  }

  _onSelectedTabChangedEvent(
      SelectedTabChangedEvent event,
      Emitter<MyJobListingsState> emit
      ) {
    selectedTabIndex = event.tabIndex;
    emit(SelectedTabChangedState(selectedTabIndex: selectedTabIndex));
  }

  _onMyJobListingsPageEnteredEvent(
      MyJobListingsPageEnteredEvent event,
      Emitter<MyJobListingsState> emit
      )async{

  }
}
