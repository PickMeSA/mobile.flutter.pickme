
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/repository/my_bookings_upcoming_repository/load_bookings_upcoming_repository.dart';

@Injectable()
class LoadBookingsUpcomingUseCase extends BaseUseCase<LoadBookingsUpcomingUseCaseParams, List<BookingEntity>>{

  final LoadBookingsUpcomingRepository loadBookingsUpcomingRepository;

  LoadBookingsUpcomingUseCase({required this.loadBookingsUpcomingRepository});

  @override
  Future<List<BookingEntity>> call({LoadBookingsUpcomingUseCaseParams? params}) async {
   try{
     return await loadBookingsUpcomingRepository.call();
   }catch(ex){
     rethrow;
   }
  }
}

class LoadBookingsUpcomingUseCaseParams extends BaseUseCaseParams{}
