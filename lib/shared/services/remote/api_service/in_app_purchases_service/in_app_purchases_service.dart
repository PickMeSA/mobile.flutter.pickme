import 'package:pickme/shared/remote/PickMeApiCore.dart';
import '../../../../domain/entities/session_secrets_entity.dart';

abstract class InAppPurchasesService extends PickMeCoreApi{

  Future<SessionSecretsEntity> getServiceSecrets({required String jobid});

}