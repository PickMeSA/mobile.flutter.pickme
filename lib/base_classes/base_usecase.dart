abstract class BaseUseCase<P extends BaseUseCaseParams, T>{

  Future<T>call({
    P? params
  });

}

abstract class BaseUseCaseParams{}