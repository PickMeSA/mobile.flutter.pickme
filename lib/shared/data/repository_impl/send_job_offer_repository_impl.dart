import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/repository/send_job_offer_repository.dart';
import 'package:pickme/shared/services/remote/api_service/send_job_offer/send_job_offer_service.dart';


@Injectable(as: SendJobOfferRepository)
class SendJobOfferRepositoryImpl extends SendJobOfferRepository {
  final SendJobOfferService sendJobOfferService;

  SendJobOfferRepositoryImpl({required this.sendJobOfferService});

  @override
  Future<bool> call({SendJobOfferRepositoryParams? params}) async{
    try{
      return await sendJobOfferService.sendOffer(job: params!.jobEntity, candidateProfileEntity: params.candidateProfileEntity);
    }catch(ex){
      rethrow;
    }
  }

}
