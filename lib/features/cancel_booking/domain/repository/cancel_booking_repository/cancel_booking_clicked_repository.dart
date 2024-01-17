import 'package:pickme/base_classes/base_repository.dart';
import 'package:pickme/features/cancel_booking/domain/entites/cancel_entity.dart';

abstract class CancelBookingClickedRepository  extends BaseRepository<CancelBookingClickedRepositoryParams, bool>{}

class CancelBookingClickedRepositoryParams extends BaseRepositoryParams{

  final CancelEntity cancelEntity;

  CancelBookingClickedRepositoryParams({required this.cancelEntity});
}
