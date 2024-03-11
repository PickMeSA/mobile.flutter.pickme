import 'package:injectable/injectable.dart';

abstract class SubscriptionRemoteDatasource {
  activateUser(String id);
  restoreUserSubscription(String id);
}


@Injectable(as: SubscriptionRemoteDatasource)
final class SubscriptionRemoteDatasourceImpl implements SubscriptionRemoteDatasource {

  @override
  activateUser(String id) {
    // TODO: implement activateUser
    throw UnimplementedError();
  }

  @override
  restoreUserSubscription(String id) {
    // TODO: implement restoreUserSubscription
    throw UnimplementedError();
  }

}