
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/RescheduleReasonEntity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/repository/reschedule_booking_repository/reschedule_booking_clicked_repository.dart';

@Injectable()
class RescheduleBookingClickedUseCase extends BaseUseCase<RescheduleBookingClickedUseCaseParams, String>{

  final RescheduleBookingClickedRepository rescheduleBookingClickedRepository;

  RescheduleBookingClickedUseCase({required this.rescheduleBookingClickedRepository});

  @override
  Future<String> call({RescheduleBookingClickedUseCaseParams? params}) async {
    try{
      return await rescheduleBookingClickedRepository.call(
          params: RescheduleBookingClickedRepositoryParams(
              rescheduleEntity: params!.rescheduleEntity));
    }catch(ex){
      rethrow;
    }
  }
}

class RescheduleBookingClickedUseCaseParams extends BaseUseCaseParams{
  final RescheduleEntity rescheduleEntity;

  RescheduleBookingClickedUseCaseParams({required this.rescheduleEntity});
}
