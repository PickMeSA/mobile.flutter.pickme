import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/in_app_purchases/domain/buy_in_app_purchase_subscription_use_case.dart';
import 'package:pickme/shared/in_app_purchases/domain/restore_in_app_purchase_subscription_use_case.dart';
import 'models/in_app_purchase_events.dart';
import '../../../base_classes/base_bloc.dart';
import '../../../core/locator/locator.dart';
import 'models/in_app_purchase_states.dart';

@injectable
class InAppPurchasesBloc
    extends BaseBloc<InAppPurchaseEvent, InAppPurchaseState> {
  final BuyInAppSubscriptionUseCase buyInAppPurchaseUseCase;
  final RestoreInAppSubscriptionUseCase restoreInAppPurchaseUseCase;

  InAppPurchasesBloc(
      this.buyInAppPurchaseUseCase, this.restoreInAppPurchaseUseCase)
      : super(InAppPurchaseLoadingState(null, const []));

  Future<void> onEven(InAppPurchaseEvent createSubscriptionEvent) async {
    emit(InAppPurchaseLoadingState(null, const []));

    switch (createSubscriptionEvent) {
      case CreateSubscriptionEvent:
        _onBuySubscription();
      case RestoreSubscriptionEvent:
        _onRestoreSubscription();
      default:
        return;
    }
  }

  Future<void> _onBuySubscription() async {
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

  Future<void> _onRestoreSubscription() async {
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
}
