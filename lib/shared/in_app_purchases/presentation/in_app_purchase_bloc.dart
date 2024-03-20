import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/in_app_purchases/domain/buy_in_app_purchase_subscription_use_case.dart';
import 'package:pickme/shared/in_app_purchases/domain/restore_in_app_purchase_subscription_use_case.dart';

import '../../../base_classes/base_bloc.dart';
import '../../../base_classes/base_event.dart';
import '../../../base_classes/base_state.dart';
import '../../../core/locator/locator.dart';
import '../../constants/default_values.dart';

part 'models/in_app_purchase_events.dart';
part 'models/in_app_purchase_states.dart';

@injectable
class InAppPurchasesBloc
    extends BaseBloc<InAppPurchaseEvent, InAppPurchaseState>  {

  late final buyInAppPurchaseUseCase = locator<BuyInAppSubscriptionUseCase>();
  late final restoreInAppPurchaseUseCase = locator<RestoreInAppSubscriptionUseCase>();

  InAppPurchasesBloc(): super(InAppPurchasesInitialState(null, [])){
    on<CreateSubscriptionEvent>((event, emit)=> _onCreateSubscriptionEvent(event, emit));
  }
  _onCreateSubscriptionEvent(
      CreateSubscriptionEvent event,
      Emitter<InAppPurchaseState> emit
      )async{
    logger.d('CreateSubscriptionEvent fired!!');
    // ToDo Handle the event when a user wants to buy a subscription here
    // emit(InAppPurchaseLoadingState());
    // try {
    //   final result = await buyInAppPurchaseUseCase.call();
    //   emit(InAppPurchaseSuccessState(result));
    // } catch (ex) {
    //   emit(InAppPurchaseErrorState(ex.toString()));
    // }
  }
}
