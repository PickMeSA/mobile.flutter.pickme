import 'package:flutter/material.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';
import 'package:pickme/shared/widgets/w_award.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

Widget qualificationSlab({
   List<OTPQualificationEntity>? otpQualificationEntityList,
   List<OTPWorkExperienceEntity>? otpWorkExperienceEntityList,
  required Widget icon,
  required String caption,
  required String buttonCaption,
  required Function onClick}){
  return Column(
    children: [
      otpQualificationEntityList!.isNotEmpty ?
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: otpQualificationEntityList.length,
              itemBuilder: (context , index){
            return AppProfileQualification(
                qualification: Award(
                    name:otpQualificationEntityList![index].name!,
                    institutionName: otpQualificationEntityList![index].issuingOrganization!,
                  educationType: otpQualificationEntityList![index].type,
                  qualificationType: AppQualificationType.education,
                  issuedOn: DateTime.tryParse(otpQualificationEntityList![index].issueDate!)
                  


                ));
          }): otpWorkExperienceEntityList!.isNotEmpty?
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: otpWorkExperienceEntityList.length,
          itemBuilder: (context , index){
            return AppProfileQualification(
                qualification: Award(
                    name:otpWorkExperienceEntityList![index].title!,
                    institutionName: otpWorkExperienceEntityList![index].company!,
                    qualificationType: AppQualificationType.experience,
                  dateStarted: DateTime.tryParse(otpWorkExperienceEntityList![index].startDate!),
                  dateEnded: DateTime.tryParse(otpWorkExperienceEntityList![index].endDate!)
                ));
          }):
      Row(
          children:[
            Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: icon),
            const SizedBox(width: 30 ),
            wText(caption,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)
            )
          ]
      ) ,

      const SizedBox(height: 20,),
      InkWell(
        onTap: ()=> onClick(),
        child: Container(
          height: 48,
          padding: const EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8, left:  16),
                child: Icon(Icons.add),
              ),
              const SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: wText(buttonCaption,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}