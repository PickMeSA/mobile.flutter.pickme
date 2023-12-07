import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/bank_details/entities/account_type_entity.dart';
import 'package:pickme/features/bank_details/entities/bank_details_entities.dart';

part 'bank_details_event.dart';
part 'bank_details_state.dart';

@injectable
class BankDetailsBloc
    extends BaseBloc<BankDetailsPageEvent, BankDetailsPageState> {

    List<DropdownMenuEntry<AccountTypeEntity>>? accountTypeEntityEntries = [];

    bool checked = false;

    BankDetailsBloc(): super(BankDetailsPageInitState()) {
        accountTypes.forEach((element) {
           accountTypeEntityEntries?.add(DropdownMenuEntry(value: element, label: element.accountType));
        });
        emit(BankDetailsPageInitState());

        on<BankDetailsValueChangedEvent>((event, emit)=> _onBankDetailsValueChangedEvent(event, emit));
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
        && event.bankDetailsEntity.accountNumber.isNotEmpty){

            checked = true;
        }
        emit(BankDetailsValueChangedState());

    }
} 
