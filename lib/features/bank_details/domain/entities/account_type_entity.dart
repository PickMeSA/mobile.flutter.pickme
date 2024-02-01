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
  AccountTypeEntity(id: 0, accountType: "Public Recipient"),
  AccountTypeEntity(id: 1, accountType: "Current / (cheque/bond) account"),
  AccountTypeEntity(id: 2, accountType: "Savings account"),
  AccountTypeEntity(id: 3, accountType: "Transmission account"),
  AccountTypeEntity(id: 4, accountType: "Bond account"),
  AccountTypeEntity(id: 5, accountType: "Subscription Share Account"),
];