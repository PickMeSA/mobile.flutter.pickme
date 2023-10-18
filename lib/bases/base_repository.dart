abstract class BaseRepository<P extends BaseRepositoryParams, T>{
  Future<void> call({
    Function(T? model)? onSuccess,
    Function(String error)? onError,
    P? params
  }) ;

}

abstract class BaseRepositoryParams{}