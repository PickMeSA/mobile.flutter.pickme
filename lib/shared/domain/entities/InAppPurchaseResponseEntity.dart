import 'package:equatable/equatable.dart';

import '../../models/error/http_error_model.dart';
import '../../models/in_app_purchases/in_app_purchase_activation_response_model.dart';

class InAppResponseActivationResultDetails extends Equatable {
  final bool activated;
  final HttpErrorEntity? errorModel;

  const InAppResponseActivationResultDetails({
    required this.activated,
    this.errorModel,
  });

  factory InAppResponseActivationResultDetails.fromModel(InAppPurchaseActivationResponseModel model) {
    return InAppResponseActivationResultDetails(
      activated: model.activated,
      errorModel: model.httpErrorModel != null ? HttpErrorEntity.fromModel(model.httpErrorModel!) : null,
    );
  }

  InAppPurchaseActivationResponseModel toModel() {
    return InAppPurchaseActivationResponseModel(
      activated: activated,
      httpErrorModel: errorModel?.toModel(),
    );
  }

  @override
  List<Object?> get props => [
    activated,
    errorModel,
  ];
}
class HttpErrorEntity {
  final String message;
  final int code;

  HttpErrorEntity({
    required this.message,
    required this.code,
  });

  factory HttpErrorEntity.fromModel(HttpErrorModel model) {
    return HttpErrorEntity(
      message: model.message,
      code: model.code,
    );
  }

  HttpErrorModel toModel() {
    return HttpErrorModel(
      message: message,
      code: code,
    );
  }
}
