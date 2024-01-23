import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/propose_alternative/domain/repository/propose_alternative_repository/propose_alternative_clicked_repository.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/reschedule_service.dart';

@Injectable(as: ProposeAlternativeClickedRepository)
class ProposeAlternativeClickedRepositoryImpl extends ProposeAlternativeClickedRepository {
  final RescheduleService rescheduleService;
  ProposeAlternativeClickedRepositoryImpl({ required this.rescheduleService});

  @override
  Future<bool> call({ProposeAlternativeClickedRepositoryParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
