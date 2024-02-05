import 'package:pickme/base_classes/back_end_calls.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/edit_personal_details/domain/repository/edit_personal_details_repository/update_remote+profile_data_repository.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/user_service/user_service.dart';

@Injectable(as: UpdateRemoteProfileDateRepository)
class UpdateRemoteProfileDateRepositoryImpl extends UpdateRemoteProfileDateRepository {

  final UserService userService;

  UpdateRemoteProfileDateRepositoryImpl({required this.userService});

  @override
  Future<UserEntity> call({UpdateRemoteProfileDateRepositoryParams? params})async {
   try{
      return await userService.updateRemoteProfileDate(userModel: params!.userEntity);
   }catch (ex){
     rethrow;
   }
  }

}
