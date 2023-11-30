import 'package:equatable/equatable.dart';

class AccountTypeEntity extends Equatable{
  int id;
  String accountType;

  AccountTypeEntity({required this.id, required this.accountType});


  @override
  // TODO: implement props
  List<Object?> get props => [id];
}


List<AccountTypeEntity> accountTypes = [
  AccountTypeEntity(id: 0, accountType: "Savings Account"),
  AccountTypeEntity(id: 1, accountType: "Current Account")
];