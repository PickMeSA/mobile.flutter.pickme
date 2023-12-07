import 'package:equatable/equatable.dart';

class AccountTypeEntity extends Equatable{
  int id;
  String accountType;

  AccountTypeEntity({required this.id, required this.accountType});


  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

/*
Savings
Current / Cheque
Business
Fixed / Deposit
Money Market Account
Transmissions
 */


List<AccountTypeEntity> accountTypes = [
  AccountTypeEntity(id: 0, accountType: "Savings"),
  AccountTypeEntity(id: 1, accountType: "Current / Cheque"),
  AccountTypeEntity(id: 2, accountType: "Business"),
  AccountTypeEntity(id: 3, accountType: "Fixed / Deposit"),
  AccountTypeEntity(id: 4, accountType: "Money Market Account"),
  AccountTypeEntity(id: 5, accountType: "Transmissions"),
];