import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'api-service.dart';

@Singleton(as:ApiService)
class DioApiService extends ApiService{

  final Dio dio;
  Logger logger = Logger(printer: PrettyPrinter(lineLength: 100000));


  DioApiService({
    required this.dio}){
   dio.interceptors.add(InterceptorsWrapper(onRequest:
       (RequestOptions options, RequestInterceptorHandler handler){
  TokenModel tokenModel = boxTokens.get(current);
         logger.d(tokenModel.accessToken);
         options.headers['Content-Type'] = 'application/json';
     options.headers['authorization'] = "Bearer ${tokenModel.accessToken}";
     return handler.next(options);
   },
   onResponse: (response, handler){
     logger.d("Response::${response.statusMessage}");
     logger.d(response.data);
     logger.d(response.toString());

     handler.next(response);
   },));
  }

  @override
  Future<Response<T>> delete<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    Response<T> response = await dio.delete(path, data: data, queryParameters: queryParameters, options: options);
    logger.d(response);
    return response;
  }

  @override
  Future<Response<T>> deleteUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken}) {
    // TODO: implement deleteUri
    throw UnimplementedError();
  }

  @override
  Future<Response> download(String urlPath, savePath, {ProgressCallback? onReceiveProgress, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, bool deleteOnError = true, String lengthHeader = Headers.contentLengthHeader, Object? data, Options? options}) {
    // TODO: implement download
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> get<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) async {
    logger.d(path);
    Response<T> response = await dio.get(
          path, data: data, queryParameters: queryParameters, options: options);
      logger.d(response);
      return response;



  }

  @override
  Future<Response<T>> getUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) {
    // TODO: implement getUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> head<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) {
    // TODO: implement head
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> headUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken}) {
    // TODO: implement headUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> patch<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) async {
    Response<T> response = await dio.patch(path, data: data, queryParameters: queryParameters, options: options);
    logger.d(response);
    return response;
  }

  @override
  Future<Response<T>> patchUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) {
    // TODO: implement patchUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> post<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) async {
    logger.d(data.toString());
    Response<T> response = await  dio.post(path,
   data: data,
   queryParameters: queryParameters,
   options: options);
   logger.d({"response": response});
   return response;
  }

  @override
  Future<Response<T>> postUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) {
    // TODO: implement postUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> put<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) async {
    logger.d(path);
    Response<T> response = await dio.put(path, data: data, queryParameters: queryParameters, options: options);
    logger.d(response);
    return response;
  }

  @override
  Future<Response<T>> putUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) {
    // TODO: implement putUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> request<T>(String url, {Object? data, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, Options? options, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) {
    // TODO: implement request
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> requestUri<T>(Uri uri, {Object? data, CancelToken? cancelToken, Options? options, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) {
    // TODO: implement requestUri
    throw UnimplementedError();
  }

}