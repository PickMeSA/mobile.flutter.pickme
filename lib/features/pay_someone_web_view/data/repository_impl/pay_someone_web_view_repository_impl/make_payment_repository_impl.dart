import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/pay_someone_web_view/domain/repository/pay_someone_web_view_repository/make_payment_repository.dart';
import 'package:pickme/shared/services/remote/api_service/pay_someone_service/pay_someone_service.dart';

@Injectable(as: MakePaymentRepository)
class MakePaymentRepositoryImpl extends MakePaymentRepository {
  final PaySomeoneService paySomeoneService;
  MakePaymentRepositoryImpl({required this.paySomeoneService});

  @override
  Future<String> call({MakePaymentRepositoryParams? params})async {
   try{
     return await paySomeoneService.makePayment();
   }catch(ex){
     rethrow;
   }
  }

}
