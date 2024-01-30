import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/pay_someone_web_view/domain/repository/pay_someone_web_view_repository/make_job_payment_repository.dart';
import 'package:pickme/shared/services/remote/api_service/pay_someone_service/pay_someone_service.dart';

@Injectable(as: MakeJobPaymentRepository)
class MakeJobPaymentRepositoryImpl extends MakeJobPaymentRepository {
  PaySomeoneService paySomeoneService;
  MakeJobPaymentRepositoryImpl({
    required this.paySomeoneService
});

  @override
  Future<String> call({MakeJobPaymentRepositoryParams? params})async {
   try{
     return await paySomeoneService.makeJobPayment(bookingEntity: params!.bookingEntity);
   }catch(ex){
     rethrow;
   }
  }

}
