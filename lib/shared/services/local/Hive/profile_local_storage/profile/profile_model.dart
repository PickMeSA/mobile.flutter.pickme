import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
part 'profile_model.g.dart';
@Injectable()
@HiveType(typeId: 4)
class ProfileModel {
  @HiveField(0)
  late String? firstName;

  @HiveField(1)
  late String? surname;

  @HiveField(3)
  late String? phoneNumber;

  @HiveField(4)
  late String? emailAddress;

  @HiveField(5)
  late String? idNumber;

  @HiveField(6)
  late String? passportNumber;

  @HiveField(7)
  late String? workPermitNumber;


  ProfileModel({
    required this.workPermitNumber,
  required this.idNumber,
  required this.emailAddress,
  required this.phoneNumber,
  required this.surname,
  required this.firstName,
  required this.passportNumber});



}