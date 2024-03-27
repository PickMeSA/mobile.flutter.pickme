import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/final_details/domain/usecases/submit_final_details_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

import '../../../final_details/domain/models/final_details_entity.dart';

part 'edit_about_me_event.dart';
part 'edit_about_me_state.dart';

@injectable
class EditAboutMeBloc
    extends BaseBloc<EditAboutMePageEvent, EditAboutMePageState> {

    final SubmitFinalDetailsUseCase submitFinalDetailsUseCase;
    FinalDetailsEntity finalDetailsEntity =  FinalDetailsEntity();

    EditAboutMeBloc({required this.submitFinalDetailsUseCase}): super(EditAboutMePageInitState()) {
        on<SubmitClickedEvent>((event, emit)=> _onSubmitClickedEvent(event, emit));
    }

    bool checked = false;


    _onSubmitClickedEvent(SubmitClickedEvent event, Emitter<EditAboutMePageState> emit) async{

            emit(SubmitClickedState()..dataState = DataState.loading);

            finalDetailsEntity = finalDetailsEntity.copyWith(newDescription: event.description);
            try{
                emit(SubmitClickedState(profileEntity:await submitFinalDetailsUseCase.call(params: SubmitFinalDetailsUseCaseParams(finalDetailsEntity: finalDetailsEntity))
                )..dataState = DataState.success);

            }catch(ex){
                emit(SubmitClickedState(error: ex.toString())..dataState = DataState.error);
            }
        }

} 
