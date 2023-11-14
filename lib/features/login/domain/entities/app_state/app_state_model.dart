import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
part 'app_state_model.g.dart';
@Injectable()
@HiveType(typeId: 2)
class AppStateModel {

  @HiveField(1)

  late bool loggedIn;

  AppStateModel({
    required this.loggedIn});



}