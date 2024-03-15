import 'package:equatable/equatable.dart';

import '../../models/in_app_purchases/in_app_purchase_activate_request_model.dart';
import '../../models/in_app_purchases/in_app_purchase_activation_response_model.dart';

class InAppPurchaseActivationResponseEntity extends Equatable {
  final bool activated;
  final ErrorResponseEntity? error;

  const InAppPurchaseActivationResponseEntity({
    required this.activated,
    this.error,
  });

  factory InAppPurchaseActivationResponseEntity.fromModel(InAppPurchaseActivationResponseModel model) {
    return InAppPurchaseActivationResponseEntity(
      activated: model.activated,
      error: model.error != null ? ErrorResponseEntity.fromModel(model.error!) : null,
    );
  }

  InAppPurchaseActivationResponseModel toModel() {
    return InAppPurchaseActivationResponseModel(
      activated: activated,
      error: error?.toModel(),
    );
  }

  @override
  List<Object?> get props => [
    activated,
    error,
  ];
}
class ErrorResponseEntity {
  final String message;
  final int code;

  ErrorResponseEntity({
    required this.message,
    required this.code,
  });

  factory ErrorResponseEntity.fromModel(Error model) {
    return ErrorResponseEntity(
      message: model.message,
      code: model.code,
    );
  }

  Error toModel() {
    return Error(
      message: message,
      code: code,
    );
  }
}
