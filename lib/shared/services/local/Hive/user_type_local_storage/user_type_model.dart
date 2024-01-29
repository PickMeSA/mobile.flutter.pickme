import 'package:hive/hive.dart';

part 'user_type_model.g.dart';

@HiveType(typeId: 1)
class UserTypeModel extends HiveObject {
  @HiveField(0)
  late String userType;

  UserTypeModel(this.userType);
}