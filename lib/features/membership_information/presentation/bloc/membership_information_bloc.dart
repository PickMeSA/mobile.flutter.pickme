import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/membership_information/entities/membership_information_entity.dart';
import 'package:pickme/features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart';
import 'package:pickme/features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart';

part 'membership_information_event.dart';
part 'membership_information_state.dart';

@injectable
class MembershipInformationBloc extends BaseBloc<MembershipInformationEvent, MembershipInformationState> {
  final GetMembershipInformationUseCase getMembershipInformationUseCase;
  List<MembershipInformationEntity> membershipInformationEntity =[];

  MembershipInformationBloc({required this.getMembershipInformationUseCase}) : super(LandingInitial()) {
    on<MembershipInformationEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetMembershipInformationEvent>((event, emit)=> _onGetMembershipInformationEvent(event, emit));
  }

  Future<void> _onGetMembershipInformationEvent(
      GetMembershipInformationEvent event,
      Emitter<MembershipInformationState> state)async{
    emit(GetMembershipInformationState().. dataState = DataState.loading);
    try{
      membershipInformationEntity = await getMembershipInformationUseCase.call();
      emit(GetMembershipInformationState()..dataState = DataState.success);
    }catch(ex){
      emit(GetMembershipInformationState(error: ex.toString())..dataState = DataState.error);
    }
  }
}
