import 'package:equatable/equatable.dart';

class BankDetailsEntity {
  final String bank;
  final String accountType;
  final String accountNumber;
  final String branchCode;
  final String accountHolderName;

  BankDetailsEntity({
    required this.accountHolderName,
    required this.accountNumber,
    required this.accountType,
    required this.bank,
    required this.branchCode
});
}