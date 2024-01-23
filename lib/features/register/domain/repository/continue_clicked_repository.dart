import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/core/exceptions/exception.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:dartz/dartz.dart';


abstract class ContinueClickedRepository extends BaseRepository<ContinueClickedRepositoryParams, bool>{

  Future<void> callBack({
      Function(String? verificationId, int? resendToken) onSuccess,
      Function(String? error)? onError,
      required String mobileNumber});
}

class ContinueClickedRepositoryParams extends BaseRepositoryParams{
  final UserEntity user;

  ContinueClickedRepositoryParams({required this.user});
}