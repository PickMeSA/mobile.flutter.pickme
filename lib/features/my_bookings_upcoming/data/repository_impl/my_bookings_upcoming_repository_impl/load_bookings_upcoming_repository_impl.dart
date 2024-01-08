import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/repository/my_bookings_upcoming_repository/load_bookings_upcoming_repository.dart';

@Injectable(as: LoadBookingsUpcomingRepository)
class LoadBookingsUpcomingRepositoryImpl extends LoadBookingsUpcomingRepository {

  LoadBookingsUpcomingRepositoryImpl();

  @override
  Future<bool> call({LoadBookingsUpcomingRepositoryParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
