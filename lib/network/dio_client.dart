import 'dart:io';

import 'package:dio/dio.dart';
import 'package:poc/network/end_points.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseDio {
  BaseDio._();
  Dio? _dio;
  // String? _token;

  static final BaseDio _singleton = BaseDio._();

  static BaseDio getInstance() {
    return _singleton;
  }

  // Future<String?> _getToken() async {
  //   return await LocalStorage.getString(StorageField.token);
  // }

  BaseOptions get _options {
    // _getToken().then((value) => _token = value);
    return BaseOptions(
      baseUrl: Endpoint.baseUrl,
      connectTimeout: Endpoint.connectionTimeout,
      receiveTimeout: Endpoint.receiveTimeout,
      // contentType: 'multipart/form-data'
      // headers: {'Content-Type': 'multipart/form-data'},
    );
  }

  Dio getDio() {
    return _dio ??= Dio(_options)
      ..interceptors.addAll(
        [
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              final token = await LocalStorage.getString(StorageField.token);
              if (token != null && token != '') {
                options.headers = {HttpHeaders.authorizationHeader: 'Bearer $token'};
              }

              print(options.data);
              return handler.next(options);
            },
            onResponse: (e, handler) {
              return handler.next(e);
            },
            onError: (e, handler) {
              return handler.next(e);
            },
          ),
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
        data: data,
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
