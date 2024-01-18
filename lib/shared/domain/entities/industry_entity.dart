import 'package:equatable/equatable.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_industry_model_model_response.dart';

class IndustryEntity extends Equatable{
   String? id;
   String? industry;
   IndustryEntity({required this.id,
        required this.industry,
      });
  @override
  List<Object?> get props => [id, industry];


  IndustryEntity.fromResponse(OTPIndustryModelModelResponse otpIndustryModelModelResponse){
    this.id = otpIndustryModelModelResponse.id;
    this.industry = otpIndustryModelModelResponse.industry;
  }
}

