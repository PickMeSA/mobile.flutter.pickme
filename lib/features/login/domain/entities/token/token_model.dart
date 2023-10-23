
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

part 'token_model.g.dart';
@Injectable()
@HiveType(typeId: 0)
class TokenModel {
  @HiveField(0)
  late String accessToken;

  @HiveField(1)
  late String refreshToken;

  @HiveField(2)
  late String tokenID;

  TokenModel.empty();

  TokenModel({
    required this.refreshToken,
  required this.accessToken,
  required this.tokenID});

}