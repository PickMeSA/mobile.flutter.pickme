import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/cancel_booking/domain/repository/cancel_booking_repository/cancel_booking_clicked_repository.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/cancel_service.dart';

@Injectable(as: CancelBookingClickedRepository)
class CancelBookingClickedRepositoryImpl extends CancelBookingClickedRepository {

  final CancelService cancelService;

  CancelBookingClickedRepositoryImpl({required this.cancelService});

  @override
  Future<bool> call({CancelBookingClickedRepositoryParams? params}) async {
    try{
      return await cancelService.cancelBookingClicked(
          cancelEntity: params!.cancelEntity);
    }catch(ex){
      rethrow;
    }
  }

}
