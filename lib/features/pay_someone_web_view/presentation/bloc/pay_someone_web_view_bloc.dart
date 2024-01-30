import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/pay_someone_web_view/domain/use_cases/pay_someone_web_view_usecase/make_job_payment_usecase.dart';
import 'package:pickme/features/pay_someone_web_view/domain/use_cases/pay_someone_web_view_usecase/make_payment_usecase.dart';

part 'pay_someone_web_view_event.dart';
part 'pay_someone_web_view_state.dart';

@injectable
class PaySomeoneWebViewBloc
    extends BaseBloc<PaySomeoneWebViewPageEvent, PaySomeoneWebViewPageState> {
    final MakePaymentUseCase makePaymentUseCase;
    final MakeJobPaymentUseCase makeJobPaymentUseCase;
    PaySomeoneWebViewBloc({required this.makeJobPaymentUseCase,required this.makePaymentUseCase}): super(PaySomeoneWebViewPageInitState()) {
        on<MakePaymentEvent>((event, emit)=> _onMakePaymentEvent(event, emit));
    }

    Future<void> _onMakePaymentEvent(
        MakePaymentEvent event,
        Emitter<PaySomeoneWebViewPageState> emit
        )async{
        emit(MakePaymentState()..dataState = DataState.loading);
        try{
            emit(MakePaymentState(url:
                event.bookingEntity!= null ?
                await makeJobPaymentUseCase.call(params: MakeJobPaymentUseCaseParams(bookingEntity: event.bookingEntity!)):
                await makePaymentUseCase.call())..dataState = DataState.success);

        }catch(ex){
            emit(MakePaymentState(error: ex.toString())..dataState = DataState.error);

        }

    }
} 
