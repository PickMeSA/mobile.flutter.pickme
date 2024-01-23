class UserEntity{
  String? id;
  final String firstName;
  final String surname;
  String mobile;
  final String? idNumber;
  final String? passportNumber;
  final String? workPermitNumber;
  final String? subscriptionType;
  final String? profileType;
  final String email;

  UserEntity({
    this.id,
    required this.email,
     this.idNumber,
    required this.surname,
    required this.firstName,
    required this.mobile,
     this.passportNumber,
     this.profileType,
     this.subscriptionType,
     this.workPermitNumber

  });

  setMobile({required String mobile}) {
  this.mobile = mobile;
  }

}


