import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/core/exceptions/exception.dart';
import 'package:pickme/features/register/domain/entities/user/user.dart';
import 'package:dartz/dartz.dart';


abstract class ContinueClickedRepository extends BaseRepository<ContinueClickedRepositoryParams, Either<bool,CustomException>>{}

class ContinueClickedRepositoryParams extends BaseRepositoryParams{
  final User user;

  ContinueClickedRepositoryParams({required this.user});
}