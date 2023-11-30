import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
part 'user_model.g.dart';
@Injectable()
@HiveType(typeId: 5)
class UserModel {
  @HiveField(0)
  late String? id;

  UserModel({
    required this.id});

}