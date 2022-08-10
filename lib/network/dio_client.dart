import 'package:dio/dio.dart';
import 'package:poc/network/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseDio {
  BaseDio._();
  Dio? _dio;

  static final BaseDio _singleton = BaseDio._();

  BaseDio();

  static BaseDio getInstance() {
    return _singleton;
  }

  final BaseOptions options = BaseOptions(
    baseUrl: Endpoint.baseUrl,
    connectTimeout: Endpoint.connectionTimeout,
    receiveTimeout: Endpoint.receiveTimeout,
    responseType: ResponseType.json,
  );

  Dio getDio() {
    return _dio ??= Dio(options)
      ..interceptors.addAll(
        [
          PrettyDioLogger(
            request: false,
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            compact: true,
          ),
          // LogInterceptor(responseBody: false),
        ],
      );
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await getDio().get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      // debugPrint(e.toString());
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await getDio().post(
        url,
        data: data.toJson(),
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      // debugPrint(e.toString());
      rethrow;
    }
  }
}
