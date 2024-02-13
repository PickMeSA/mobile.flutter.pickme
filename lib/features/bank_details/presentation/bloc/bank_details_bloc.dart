import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/bank_details/domain/entities/account_type_entity.dart';
import 'package:pickme/features/bank_details/domain/usecases/bank_details_submitted_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';

import '../../domain/entities/bank_details_entities.dart';

part 'bank_details_event.dart';
part 'bank_details_state.dart';

@injectable
class BankDetailsBloc
    extends BaseBloc<BankDetailsPageEvent, BankDetailsPageState> {

    final BankDetailsSubmittedUseCase bankDetailsSubmittedUseCase;
    List<DropdownMenuEntry<AccountTypeEntity>>? accountTypeEntityEntries = [];
    bool preloaderActive = false;
    bool checked = false;

    BankDetailsBloc({required this.bankDetailsSubmittedUseCase}): super(BankDetailsPageInitState()) {
        on<BankDetailsPageEnteredEvent>((event, emit)=> _onBankDetailsPageEnteredEvent(event, emit));
        on<BankDetailsValueChangedEvent>((event, emit)=> _onBankDetailsValueChangedEvent(event, emit));
        on<BankDetailsSubmittedEvent>((event, emit)=> _onBankDetailsSubmittedEvent(event, emit));
    }

    _onBankDetailsPageEnteredEvent(
        BankDetailsPageEnteredEvent event,
        Emitter<BankDetailsPageState> emit
        )async{
        accountTypeEntityEntries = accountTypes.map((e) => DropdownMenuEntry(value: e, label: e.accountType)).toList();
        emit(BankDetailsPageEnteredState());
    }

    _onBankDetailsValueChangedEvent(
        BankDetailsValueChangedEvent event,
        Emitter<BankDetailsPageState> emit
        )async{

        checked = false;

        if(
        event.bankDetailsEntity.branchCode.isNotEmpty
        && event.bankDetailsEntity.bank.isNotEmpty
        && event.bankDetailsEntity.accountType.isNotEmpty
        && event.bankDetailsEntity.accountNumber.isNotEmpty
        && event.bankDetailsEntity.accountType.isNotEmpty){

            checked = true;
        }
        emit(BankDetailsValueChangedState());

    }

    _onBankDetailsSubmittedEvent(
        BankDetailsSubmittedEvent event,
        Emitter<BankDetailsPageState> emit
        )async{
try {
    emit(BankDetailsSubmittedState()
        ..dataState = DataState.loading);
    ProfileEntity profileEntity = await bankDetailsSubmittedUseCase.call(
        params: BankDetailsSubmittedUseCaseParams(
            bankDetailsEntity: event.bankDetailsEntity));
    emit(BankDetailsSubmittedState(profileEntity: profileEntity)
        ..dataState = DataState.success);
}catch(ex){
    emit(BankDetailsSubmittedState(profileEntity: profileEntity)
        ..dataState = DataState.error);
}

    }
} 
