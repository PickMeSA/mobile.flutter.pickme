import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'api-service.dart';

@Singleton(as:ApiService)
class DioApiService extends ApiService{

  final Dio dio;
  Logger logger = Logger();


  DioApiService({
    required this.dio}){
   dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler){
     // TokenModel tokenModel = boxTokens.get(current);
     options.headers['authorization'] = "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImE2YzYzNTNmMmEzZWMxMjg2NTA1MzBkMTVmNmM0Y2Y0NTcxYTQ1NTciLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcGljay1tZS02MWYzNCIsImF1ZCI6InBpY2stbWUtNjFmMzQiLCJhdXRoX3RpbWUiOjE3MDA2MzgzMjAsInVzZXJfaWQiOiI0Q0hhbFdqV215TklmNVBDcEc4RTVudHlBVHQxIiwic3ViIjoiNENIYWxXaldteU5JZjVQQ3BHOEU1bnR5QVR0MSIsImlhdCI6MTcwMDYzODMyMCwiZXhwIjoxNzAwNjQxOTIwLCJlbWFpbCI6ImFzaXRob2xlQGR2dHNvZnR3YXJlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJhc2l0aG9sZUBkdnRzb2Z0d2FyZS5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.XvkMYjpLQDYL3SH9G5ajnhLrmKJluw42XJVLB2JWKig1g_A4NMADV2__6_UlzmoHQ6Pp765h8Te3ltFNWrjzyRR4bsqdTRw7Ae_8c6lZ7qjCGWD7pd1GxSzp2ycOpOlMzZvQvowfHkuQNbuHCNpt4Hje5h4U9lBpBmFyRoUzN2FNXj2hQ89JKP7-PEmF2itc8rXyBu01PUftzsBhmoSdHQEOQHHNMdyopnJ18d9ZwNLiLLrPuyDEp1TqRHkT4UjCNX27EVk5PkY_iIJ7jqKLboOs4JA9P9vuKaOxJogpvWmWQXnvdeMD90YBfWdRpG3iu5_IAt79WOEFp2gvR8UImw";
   // dio.interceptors.add(InterceptorsWrapper(onRequest:
   //     (RequestOptions options, RequestInterceptorHandler handler){
   //   //attach
   //   TokenModel tokenModel = boxTokens.get(current);
   //   options.headers['Content-Type'] = 'application/json';
   //   options.headers['authorization'] = "Bearer ${tokenModel.accessToken}";
     return handler.next(options);
   }));
  }

  @override
  Future<Response<T>> delete<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) {
    // TODO: implement delete
    throw UnimplementedError();
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
   Response<T> response = await  dio.post(path,
   data: data,
   queryParameters: queryParameters,
   options: options);
   logger.d(response);
   return response;
  }

  @override
  Future<Response<T>> postUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) {
    // TODO: implement postUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> put<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) async {
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