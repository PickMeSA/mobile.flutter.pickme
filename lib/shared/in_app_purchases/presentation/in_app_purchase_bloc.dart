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
    extends BaseBloc<InAppPurchaseEvent, InAppPurchaseState> {

  late final buyInAppPurchaseUseCase = locator<BuyInAppSubscriptionUseCase>();
  late final restoreInAppPurchaseUseCase = locator<
      RestoreInAppSubscriptionUseCase>();

  InAppPurchasesBloc() : super(InAppPurchaseLoadingState(null, const [])) {
    on<CreateSubscriptionEvent>((event, emit) =>
        _onCreateSubscriptionEvent(event, emit));
    on<RestoreSubscriptionEvent>((event, emit) =>
        _onRestoreSubscription(event, emit));
  }

  Future<void> _onCreateSubscriptionEvent(CreateSubscriptionEvent event,
      Emitter<InAppPurchaseState> emit) async {
    emit(InAppPurchaseLoadingState(null, const []));

    try {
      final subscriptionResults = await buyInAppPurchaseUseCase();
      emit(InAppPurchasedState(
          null, subscriptionResults.productIds, subscriptionResults.purchased));
    } on Exception catch (ex) {
      emit(InAppPurchasedState(ex.toString(), null, false));
    } catch (ex) {
      emit(InAppPurchasedState(
          "Subscription payment failed. Please try again", null, false));
    }
  }

  Future<void> _onRestoreSubscription(
      RestoreSubscriptionEvent event,
      Emitter<InAppPurchaseState> emit) async {
    emit(InAppPurchaseLoadingState(null, const []));

    try {
      final subscriptionResults = await buyInAppPurchaseUseCase();
      emit(InAppPurchasedState(
          null, subscriptionResults.productIds, subscriptionResults.purchased));
    } on Exception catch (ex) {
      emit(InAppPurchasedState(ex.toString(), null, false));
    } catch (ex) {
      emit(InAppPurchasedState(
          "Subscription payment failed. Please try again", null, false));
    }
  }
