
import 'package:pickme/base_classes/base_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/propose_alternative/domain/repository/propose_alternative_repository/propose_alternative_clicked_repository.dart';

@Injectable()
class ProposeAlternativeClickedUseCase extends BaseUseCase<ProposeAlternativeClickedUseCaseParams, bool>{

  final ProposeAlternativeClickedRepository proposeAlternativeClickedRepository;

  ProposeAlternativeClickedUseCase({required this.proposeAlternativeClickedRepository});

  @override
  Future<bool> call({ProposeAlternativeClickedUseCaseParams? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class ProposeAlternativeClickedUseCaseParams extends BaseUseCaseParams{}
