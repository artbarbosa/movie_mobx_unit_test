import 'package:dio/dio.dart';

import '../../failures/failures.dart';
import 'http_client_service.dart';

class DioHttpServiceImp implements IHttpClientService {
  final Dio _dio;

  DioHttpServiceImp(this._dio);

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    try {
      return _dio.get<T>(
        path,
        queryParameters: queryParameters,
      );
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw NoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw NoInternetConnection();
      } else {
        throw DioServiceError(
          stackTrace: stackTrace,
          label: 'DioHttpServiceImp-get',
          exception: e.error,
          errorMessage: e.message,
        );
      }
    }
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    try {
      return _dio.put<T>(
        path,
        queryParameters: queryParameters,
      );
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw NoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw NoInternetConnection();
      } else {
        throw DioServiceError(
          stackTrace: stackTrace,
          label: 'DioHttpServiceImp-put',
          exception: e.error,
          errorMessage: e.message,
        );
      }
    }
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    try {
      return _dio.delete<T>(
        path,
        queryParameters: queryParameters,
      );
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw NoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw NoInternetConnection();
      } else {
        throw DioServiceError(
          stackTrace: stackTrace,
          label: 'DioHttpServiceImp-delete',
          exception: e.error,
          errorMessage: e.message,
        );
      }
    }
  }
}
