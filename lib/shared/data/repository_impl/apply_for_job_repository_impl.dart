import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/repository/apply_for_job_repository.dart';
import 'package:pickme/shared/services/remote/api_service/apply_for_job_service/apply_for_job_service.dart';

@Injectable(as: ApplyForJobRepository)
class ApplyForJobRepositoryImpl  extends ApplyForJobRepository{
  final ApplyForJobService service;

  ApplyForJobRepositoryImpl({required this.service});
  @override
  Future<bool> call({ApplyForJobRepositoryParams? params}) {
    return service.applyForJob(params: params!);
  }

}