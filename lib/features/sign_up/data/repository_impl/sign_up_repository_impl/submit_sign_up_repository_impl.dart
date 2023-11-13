import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart';

@Injectable(as: SubmitSignUpRepository)
class SubmitSignUpRepositoryImpl extends SubmitSignUpRepository {

  SubmitSignUpRepositoryImpl();

  @override
  Future<bool> call({SubmitSignUpRepositoryParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
