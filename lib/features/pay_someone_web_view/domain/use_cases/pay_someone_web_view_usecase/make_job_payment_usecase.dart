
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/pay_someone_web_view/domain/repository/pay_someone_web_view_repository/make_job_payment_repository.dart';

@Injectable()
class MakeJobPaymentUseCase extends BaseUseCase<MakeJobPaymentUseCaseParams, String>{

  final MakeJobPaymentRepository makeJobPaymentRepository;

  MakeJobPaymentUseCase({required this.makeJobPaymentRepository});

  @override
  Future<String> call({MakeJobPaymentUseCaseParams? params}) {
    try{
      return makeJobPaymentRepository.call(params: MakeJobPaymentRepositoryParams(bookingEntity: params!.bookingEntity));
    }catch(ex){
      rethrow;
    }
  }
}

class MakeJobPaymentUseCaseParams extends BaseUseCaseParams{
  BookingEntity bookingEntity;

  MakeJobPaymentUseCaseParams({required this.bookingEntity});
}
