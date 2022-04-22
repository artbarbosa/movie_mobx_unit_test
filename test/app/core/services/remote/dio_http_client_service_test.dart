import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_mobx_unit_test/app/core/failures/failures.dart';
import 'package:movie_mobx_unit_test/app/core/services/remote/dio_http_client_service.dart';

import '../../../../mocks/mock.dart';

void main() {
  late DioHttpServiceImp httpClient;
  late DioMock dio;
  setUpAll(() {
    dio = DioMock();
    httpClient = DioHttpServiceImp(dio);
  });

  group('DioHttpServiceImp - get', () {
    test('Should return Response', () async {
      when(() => dio.get(any())).thenAnswer((_) async => ResponseMock());

      final result = await httpClient.get('');

      expect(result, isA<Response>());
    });

    test('Should throw NoInternetConnection - DioErroType connectTimeout',
        () async {
      when(() => dio.get(any())).thenThrow(DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.connectTimeout));

      expect(() async => await httpClient.get(''),
          throwsA(isA<NoInternetConnection>()));
    });
    test('Should throw NoInternetConnection - DioErroType receiveTimeout',
        () async {
      when(() => dio.get(any())).thenThrow(DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.receiveTimeout));

      expect(() async => await httpClient.get(''),
          throwsA(isA<NoInternetConnection>()));
    });
    test('Should throw NoInternetConnection - DioErroType receiveTimeout',
        () async {
      when(() => dio.get(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.other,
      ));

      expect(() async => await httpClient.get(''),
          throwsA(isA<NoInternetConnection>()));
    });

    test('Should throw DioServiceError - DioErroType receiveTimeout', () async {
      when(() => dio.get(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.cancel,
      ));

      expect(() async => await httpClient.get(''),
          throwsA(isA<DioServiceError>()));
    });
  });

  group('DioHttpServiceImp - put', () {
    test('Should return Response', () async {
      when(() => dio.put(any())).thenAnswer((_) async => ResponseMock());

      final result = await httpClient.put('');

      expect(result, isA<Response>());
    });

    test('Should throw NoInternetConnection - DioErroType connectTimeout',
        () async {
      when(() => dio.put(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.connectTimeout,
      ));

      expect(() async => await httpClient.put(''),
          throwsA(isA<NoInternetConnection>()));
    });
    test('Should throw NoInternetConnection - DioErroType receiveTimeout',
        () async {
      when(() => dio.put(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.receiveTimeout,
      ));

      expect(() async => await httpClient.put(''),
          throwsA(isA<NoInternetConnection>()));
    });
    test('Should throw NoInternetConnection - DioErroType receiveTimeout',
        () async {
      when(() => dio.put(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.other,
      ));

      expect(() async => await httpClient.put(''),
          throwsA(isA<NoInternetConnection>()));
    });

    test('Should throw DioServiceError - DioErroType receiveTimeout', () async {
      when(() => dio.put(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.cancel,
      ));

      expect(() async => await httpClient.put(''),
          throwsA(isA<DioServiceError>()));
    });
  });

  group('DioHttpServiceImp - delete', () {
    test('Should return Response', () async {
      when(() => dio.delete(any())).thenAnswer((_) async => ResponseMock());

      final result = await httpClient.delete('');

      expect(result, isA<Response>());
    });

    test('Should throw NoInternetConnection - DioErroType connectTimeout',
        () async {
      when(() => dio.delete(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.connectTimeout,
      ));

      expect(() async => await httpClient.delete(''),
          throwsA(isA<NoInternetConnection>()));
    });
    test('Should throw NoInternetConnection - DioErroType receiveTimeout',
        () async {
      when(() => dio.delete(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.receiveTimeout,
      ));

      expect(() async => await httpClient.delete(''),
          throwsA(isA<NoInternetConnection>()));
    });
    test('Should throw NoInternetConnection - DioErroType receiveTimeout',
        () async {
      when(() => dio.delete(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.other,
      ));

      expect(() async => await httpClient.delete(''),
          throwsA(isA<NoInternetConnection>()));
    });

    test('Should throw DioServiceError - DioErroType receiveTimeout', () async {
      when(() => dio.delete(any())).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.cancel,
      ));

      expect(() async => await httpClient.delete(''),
          throwsA(isA<DioServiceError>()));
    });
  });
}
