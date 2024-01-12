import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/bank_details/domain/entities/bank_details_entities.dart';
import 'package:pickme/features/my_banking_details/domain/use_cases/my_banking_details_usecase/get_banking_details_usecase.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_payment_details_entity.dart';

part 'my_banking_details_event.dart';
part 'my_banking_details_state.dart';

@injectable
class MyBankingDetailsBloc
    extends BaseBloc<MyBankingDetailsPageEvent, MyBankingDetailsPageState> {

     OTPPaymentDetailsEntity? otpPaymentDetailsEntity;

     final GetBankingDetailsUseCase getBankingDetailsUseCase;
    MyBankingDetailsBloc({
         required this.getBankingDetailsUseCase
}): super(MyBankingDetailsPageInitState()) {

        on<GetBankingDetailsEvent>((event, emit)=> _onGetBankingDetailsEvent(event, emit));
    }

    Future<void>_onGetBankingDetailsEvent(
        GetBankingDetailsEvent event,
        Emitter<MyBankingDetailsPageState> emit
        )async{
        emit(GetBankingDetailsState()..dataState = DataState.loading);
        try{
            otpPaymentDetailsEntity = await getBankingDetailsUseCase.call();
            emit(GetBankingDetailsState()..dataState = DataState.success);
        }catch(ex){
            emit(GetBankingDetailsState(error: ex.toString())..dataState = DataState.error);
        }
    }
} 
