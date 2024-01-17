
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/cancel_booking/domain/entites/cancel_entity.dart';
import 'package:pickme/features/cancel_booking/domain/repository/cancel_booking_repository/cancel_booking_clicked_repository.dart';

@Injectable()
class CancelBookingClickedUseCase extends BaseUseCase<CancelBookingClickedUseCaseParams, bool>{

  final CancelBookingClickedRepository cancelBookingClickedRepository;

  CancelBookingClickedUseCase({required this.cancelBookingClickedRepository});

  @override
  Future<bool> call({CancelBookingClickedUseCaseParams? params})async {
    try{
      return await cancelBookingClickedRepository.call(
          params: CancelBookingClickedRepositoryParams(
              cancelEntity: params!.cancelEntity));
    }catch(ex){
      rethrow;
    }
  }
}

class CancelBookingClickedUseCaseParams extends BaseUseCaseParams{

  final CancelEntity cancelEntity;

  CancelBookingClickedUseCaseParams({required this.cancelEntity});
}
