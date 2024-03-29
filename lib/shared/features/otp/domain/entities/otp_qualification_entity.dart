import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_qualification_model_response_model_response.dart';

class OTPQualificationEntity{

  String? type;
  String? name;
  String? issuingOrganization;
  DateTime? issueDate;
  List<OTPQualificationEntity>? qualifications;
  String? supportingDocuments;

  OTPQualificationEntity({
    required this.type,
  required this.name,
  required this.issueDate,
  required this.issuingOrganization,
  this.supportingDocuments});

  OTPQualificationEntity.fromResponse( OTPQualificationModelResponse response){
    type = response.type??"";
    name = response.name??"";
    issuingOrganization = response.issuingOrganization??"";
    issueDate = DateTime.parse(response.issueDate!);
  }

  toQualificationList(List<OTPQualificationModelResponse> response){
    qualifications = [];
    response.forEach((element) {
      qualifications!.add(OTPQualificationEntity.fromResponse(element));
    });
  }

  OTPQualificationModelResponse toResponse(){
    return OTPQualificationModelResponse(
        supportedDocumentId: supportingDocuments,
        type: type,
        name: name,
        issuingOrganization: issuingOrganization,
        issueDate: issueDate.toString());
  }
}