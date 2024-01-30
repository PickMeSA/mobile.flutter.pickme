
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/pay_someone_web_view/domain/repository/pay_someone_web_view_repository/make_payment_repository.dart';

@Injectable()
class MakePaymentUseCase extends BaseUseCase<MakePaymentUseCaseParams, String>{

  final MakePaymentRepository makePaymentRepository;

  MakePaymentUseCase({required this.makePaymentRepository});

  @override
  Future<String> call({MakePaymentUseCaseParams? params})async {
    try{
      return await makePaymentRepository.call();
    }catch(ex){
      rethrow;
    }
  }


}

class MakePaymentUseCaseParams extends BaseUseCaseParams{

}
