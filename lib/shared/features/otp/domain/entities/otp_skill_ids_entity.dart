import 'package:equatable/equatable.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_skill_id_model_response.dart';

class OTPSkillIdsEntity {
  List<int>? skillIds = [];


  OTPSkillIdsEntity({
    required this.skillIds});

  OTPSkillIdsEntity.fromResponse(SkillIdModelResponse response){
    response.skillsId.forEach((element) {
      skillIds?.add(element);
    });
  }


}