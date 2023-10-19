abstract class BaseRepository<P extends BaseRepositoryParams, T>{
  Future<T> call({
    P? params
  }) ;

}

abstract class BaseRepositoryParams{}