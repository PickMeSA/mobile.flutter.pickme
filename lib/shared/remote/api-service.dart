
import 'package:dio/dio.dart';

abstract class ApiService {

  Future<Response<T>> delete<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken});

  Future<Response<T>> deleteUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken}) ;

  Future<Response> download(String urlPath, savePath, {ProgressCallback? onReceiveProgress, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, bool deleteOnError = true, String lengthHeader = Headers.contentLengthHeader, Object? data, Options? options}) ;

  Future<Response<T>> fetch<T>(RequestOptions requestOptions);

  Future<Response<T>> get<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress});

  Future<Response<T>> getUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress});

  Future<Response<T>> head<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken});

  Future<Response<T>> headUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken}) ;

  Future<Response<T>> patch<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) ;

  Future<Response<T>> patchUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) ;

  Future<Response<T>> post<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress});

  Future<Response<T>> postUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) ;

  Future<Response<T>> put<T>(String path, {Object? data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) ;

  Future<Response<T>> putUri<T>(Uri uri, {Object? data, Options? options, CancelToken? cancelToken, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) ;

  Future<Response<T>> request<T>(String url, {Object? data, Map<String, dynamic>? queryParameters, CancelToken? cancelToken, Options? options, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress}) ;

  Future<Response<T>> requestUri<T>(Uri uri, {Object? data, CancelToken? cancelToken, Options? options, ProgressCallback? onSendProgress, ProgressCallback? onReceiveProgress});

}