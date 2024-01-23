import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/terms_and_conditions/domain/entities/terms_and_conditions_entity.dart';
import 'package:pickme/features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart';

part 'terms_and_conditions_event.dart';
part 'terms_and_conditions_state.dart';

@injectable
class TermsAndConditionsBloc extends BaseBloc<TermsAndConditionsEvent, TermsAndConditionsState> {
  final GetRemoteTermsAndConditionsUseCase getRemoteTermsAndConditionsUseCase;
  late TermsAndConditionsEntity termsAndConditionsEntity;
  TermsAndConditionsBloc(
  {required this.getRemoteTermsAndConditionsUseCase}) : super(LandingInitial()) {
    on<TermsAndConditionsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetRemoteTermsAndConditionsEvent>((event , emit)=> _onGetRemoteTermsAndConditionsEvent(event, emit));
  }

  _onGetRemoteTermsAndConditionsEvent(
      GetRemoteTermsAndConditionsEvent event,
      Emitter<TermsAndConditionsState> emit
      )async{
    try {
      emit(GetRemoteTermsAndConditionsState()
        ..dataState = DataState.loading);
      termsAndConditionsEntity =
      await getRemoteTermsAndConditionsUseCase.call();
      emit(GetRemoteTermsAndConditionsState()..dataState = DataState.success);
    }catch(ex){
      emit(GetRemoteTermsAndConditionsState(error:  ex.toString())..dataState = DataState.error);
    }

      }
}
