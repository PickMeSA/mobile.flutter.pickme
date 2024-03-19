import 'package:injectable/injectable.dart';
import 'package:pickme/shared/in_app_purchases/domain/buy_in_app_purchase_subscription_use_case.dart';
import 'package:pickme/shared/in_app_purchases/domain/restore_in_app_purchase_subscription_use_case.dart';
import 'models/in_app_purchase_events.dart';
import '../../../base_classes/base_bloc.dart';
import '../../../core/locator/locator.dart';
import 'models/in_app_purchase_states.dart';


@injectable
class InAppPurchasesBloc
    extends BaseBloc<InAppPurchaseEvent, InAppPurchaseState>  {

  late final buyInAppPurchaseUseCase = locator<BuyInAppSubscriptionUseCase>();
  late final restoreInAppPurchaseUseCase = locator<RestoreInAppSubscriptionUseCase>();

  InAppPurchasesBloc(): super(InAppPurchasesInitialState(null, [])){}
}
