
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';

import '../../repository/my_bookings_upcoming_repository/get_upcoming_bookings_repository.dart';

@Injectable()
class GetUpComingBookingsUseCase extends BaseUseCase<GetUpComingBookingsUseCaseParams, List<BookingEntity>>{

  final GetUpComingBookingsRepository getUpComingBookingsRepository;

  GetUpComingBookingsUseCase({required this.getUpComingBookingsRepository});

  @override
  Future<List<BookingEntity>> call({GetUpComingBookingsUseCaseParams? params}) async {
    try{
      return await getUpComingBookingsRepository.call();
    }catch(ex){
      rethrow;
    }
  }
}

class GetUpComingBookingsUseCaseParams extends BaseUseCaseParams{}
