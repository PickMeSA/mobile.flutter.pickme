import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
part 'biometrics_model.g.dart';

@Injectable()
@HiveType(typeId: 1)
class BiometricsModel {

  @HiveField(0)

  late bool biometrics;

  BiometricsModel({
    required this.biometrics});



}