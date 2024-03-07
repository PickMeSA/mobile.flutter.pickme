import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/apply_for_job/domain/repository/apply_for_job_repository/update_job_date_time_repository.dart';
import 'package:pickme/shared/services/remote/api_service/jobs_service/jobs_service.dart';

@Injectable(as: UpdateJobDateTimeRepository)
class UpdateJobDateTimeRepositoryImpl extends UpdateJobDateTimeRepository {
      final JobService jobService;
  UpdateJobDateTimeRepositoryImpl({required this.jobService});

  @override
  Future<bool> call({UpdateJobDateTimeRepositoryParams? params}) async{
    try{
      return await jobService.updateJobDateTime(jobEntity: params!.jobEntity, dateAndTime: params!.dateAndTime);
    } on DioException catch (ex){

      throw(ex.response.toString());
    }catch(ex){
      rethrow;
    }
  }

}
