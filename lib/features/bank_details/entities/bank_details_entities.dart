import 'package:equatable/equatable.dart';

class BankDetailsEntity {
  final String bank;
  final String accountnUmber;
  final String accountNumber;
  final String branchCode;

  BankDetailsEntity({
    required this.accountNumber,
    required this.accountnUmber,
    required this.bank,
    required this.branchCode
});
}