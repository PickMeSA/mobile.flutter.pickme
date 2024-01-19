import 'package:equatable/equatable.dart';
import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_skill_id_model_response.dart';

class OTPSkillIdsEntity {
  int? id;
  String? skill;
  List<OTPSkillIdsEntity>? skills;


  OTPSkillIdsEntity({
    required this.id,
  required this.skill});

  OTPSkillIdsEntity.fromResponse(List<SkillIdModelResponse> response){
    skills = [];
    response.forEach((element) {
      skills?.add(OTPSkillIdsEntity(id: element.id, skill: element.skill));
    });
  }


}