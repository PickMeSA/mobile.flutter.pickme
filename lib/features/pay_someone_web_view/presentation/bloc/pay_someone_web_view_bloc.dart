import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/pay_someone_web_view/domain/use_cases/pay_someone_web_view_usecase/make_payment_usecase.dart';

part 'pay_someone_web_view_event.dart';
part 'pay_someone_web_view_state.dart';

@injectable
class PaySomeoneWebViewBloc
    extends BaseBloc<PaySomeoneWebViewPageEvent, PaySomeoneWebViewPageState> {
    final MakePaymentUseCase makePaymentUseCase;
    PaySomeoneWebViewBloc({required this.makePaymentUseCase}): super(PaySomeoneWebViewPageInitState()) {
        on<MakePaymentEvent>((event, emit)=> _onMakePaymentEvent(event, emit));
    }

    Future<void> _onMakePaymentEvent(
        MakePaymentEvent event,
        Emitter<PaySomeoneWebViewPageState> emit
        )async{
        emit(MakePaymentState()..dataState = DataState.loading);
        try{
            emit(MakePaymentState(url: await makePaymentUseCase.call())..dataState = DataState.success);

        }catch(ex){
            emit(MakePaymentState(error: ex.toString())..dataState = DataState.error);

        }

    }
} 
