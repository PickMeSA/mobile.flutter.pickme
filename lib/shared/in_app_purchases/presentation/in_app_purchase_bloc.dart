import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import '../../../core/locator/locator.dart';
import '../../../base_classes/base_bloc.dart';
import '../../../base_classes/base_event.dart';
import '../../../base_classes/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../localization/generated/l10n.dart';
import '../domain/in_app_purchase_interactor.dart';
import '../domain/product_purchase_state_change_delegate.dart';
import 'package:pickme/shared/in_app_purchases/domain/models/subscription_payment_result.dart';
import 'package:pickme/shared/in_app_purchases/domain/models/subscription_restore_result.dart';
import 'package:pickme/shared/in_app_purchases/domain/buy_in_app_purchase_subscription_use_case.dart';
import 'package:pickme/shared/in_app_purchases/domain/restore_in_app_purchase_subscription_use_case.dart';

import 'models/in_app_purchase_details.dart';

part 'models/in_app_purchase_events.dart';

part 'models/in_app_purchase_states.dart';

@injectable
class InAppPurchasesBloc
    extends BaseBloc<InAppPurchaseEvent, InAppPurchaseState>
    implements
        SubscriptionPaymentResultHandler,
        SubscriptionRestoreResultHandler {
  late final buyInAppPurchaseUseCase = locator<BuyInAppSubscriptionUseCase>();
  late final restoreInAppPurchaseUseCase =
      locator<RestoreInAppSubscriptionUseCase>();
  late final localization = locator<AppLocalizations>();
  final InAppPurchaseInteractor inAppPurchaseInteractor = locator<InAppPurchaseInteractor>();

  InAppPurchasesBloc() : super(InAppPurchaseLoadingState(null, "")) {
    on<CreateSubscriptionEvent>(
        (event, emit) => _onCreateSubscriptionEvent(event, emit));
    on<RestoreSubscriptionEvent>(
        (event, emit) => _onRestoreSubscription(event, emit));
  }

  Future<void> _onCreateSubscriptionEvent(
      CreateSubscriptionEvent event, Emitter<InAppPurchaseState> emit) async {
    emit(InAppPurchaseLoadingState(null, ""));
    bool hasTriggeredInAppPurchase = false;
    try {
      hasTriggeredInAppPurchase = await buyInAppPurchaseUseCase(this);
    } catch (exception, stackTrace) {
      logger.e("Failed to buy subscription",
          error: exception, stackTrace: stackTrace);
    } finally {
      if (!hasTriggeredInAppPurchase) {
        emit(InAppPurchasedState(
            "Subscription payment failed. Please try again",
            null,
            false,
            false,
            null));
      }
    }
  }

  Future<void> _onRestoreSubscription(
      RestoreSubscriptionEvent event, Emitter<InAppPurchaseState> emit) async {
    emit(InAppPurchaseLoadingState(null, ""));
    bool hasTriggeredInAppPurchaseRestore = false;
    try {
      hasTriggeredInAppPurchaseRestore = await restoreInAppPurchaseUseCase();
    } catch (exception, stackTrace) {
      logger.e(localization.subscriptionNotBought,
          error: exception, stackTrace: stackTrace);
    } finally {
      if (!hasTriggeredInAppPurchaseRestore) {
        emit(InAppRestoredState(
            localization.subscriptionNotRestored, null, false, null));
      }
    }
  }

  @override
  onSubscriptionPurchaseResult(SubscriptionPaymentResult result) {
    logger.i("$result");
    emit(InAppPurchasedState(null, result.productId, result.purchased,
        result.cancelled, result.purchaseDetails));
  }

  @override
  onSubscriptionRestoreResult(SubscriptionRestoreResult result) {
    logger.i("$result");
    emit(InAppRestoredState(
        null, result.productId, result.restored, result.purchaseDetails));
  }
}
