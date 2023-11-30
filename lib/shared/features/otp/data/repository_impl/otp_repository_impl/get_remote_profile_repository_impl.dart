import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart';

@Injectable(as: GetRemoteProfileRepository)
class GetRemoteProfileRepositoryImpl extends GetRemoteProfileRepository {

  GetRemoteProfileRepositoryImpl();

  @override
  Future<ProfileEntity> call({GetRemoteProfileRepositoryParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
