import 'package:pickme/shared/features/otp/data/models/otp_model_response/otp_payment_details_model_response.dart';

class OTPPaymentDetailsEntity{
  String? bankName;
  String? bankAccountType;
  String? bankAccountNumber;
  String? bankBranchCode;
  String? taxNumber;
  String? vatNumber;

  OTPPaymentDetailsEntity({
    required this.bankAccountNumber,
  required this.bankAccountType,
  required this.bankBranchCode,
  required this.bankName,
  required this.taxNumber,
  required this.vatNumber});

  OTPPaymentDetailsEntity.fromResponse(OTPPaymentDetailsModelResponse response){
    bankName = response.bankName??"";
    bankBranchCode = response.bankBranchCode??"";
    bankAccountType = response.bankAccountType??"";
    bankAccountNumber = response.bankAccountNumber??"";
    taxNumber = response.taxNumber;
    vatNumber = response.vatNumber;
  }

}