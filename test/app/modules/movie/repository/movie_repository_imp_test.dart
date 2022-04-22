import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_mobx_unit_test/app/core/failures/failures.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/errors/movie_failures.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/details_movies_up_comming_model.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/genres_movies_model.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/movie_model.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/repository/movie_repository_imp.dart';

import '../../../../mocks/mock.dart';

void main() {
  late DioHttpServiceMock diohttpService;
  late MovieRepositoryImp repositoryImp;

  setUpAll(() {
    diohttpService = DioHttpServiceMock();
    repositoryImp = MovieRepositoryImp(httpService: diohttpService);
  });

  group('MovieRepositoryImp - Get Movies Up Comming', () {
    test('Should return a list of Movies', () async {
      when(() => diohttpService.get(any())).thenAnswer((_) async => Response(
          data: responseJsonMovies, requestOptions: RequestOptions(path: '')));

      var result = await repositoryImp.getMoviesUpComming(3);

      expect(result, isA<List<MovieModel>>());
      expect(result.length, 2);
      expect(result[0].genreIds.first, 18);
      expect(result[0].id, 670981);
    });

    test('Should Throw DioServiceError throws MovieUpComingError ', () async {
      when(() => diohttpService.get(any())).thenThrow(DioServiceError(
        errorMessage: '',
        exception: '',
        label: '',
      ));

      expect(() async => await repositoryImp.getMoviesUpComming(3),
          throwsA(isA<MovieUpComingError>()));
    });
    test(
        'Should Throw NoInternetConnection throws MovieUpComingNoInternetConnection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(NoInternetConnection());

      expect(() async => await repositoryImp.getMoviesUpComming(3),
          throwsA(isA<MovieUpComingNoInternetConnection>()));
    });
  });

  group('MovieRepositoryImp - Get Details Movies Up Comming', () {
    test('Should return a list Deatils Movies', () async {
      when(() => diohttpService.get(any())).thenAnswer((_) async => Response(
          data: responseJsonMovies, requestOptions: RequestOptions(path: '')));

      var result = await repositoryImp.getDetailsMoviesUpComming();

      expect(result, isA<DetailsMoviesUpCommingModel>());
      expect(result.totalPages, 23);
      expect(result.totalResults, 443);
    });

    test('Should Throw DioServiceError throws DetailsMovieUpComingError',
        () async {
      when(() => diohttpService.get(any())).thenThrow(DioServiceError(
        errorMessage: '',
        exception: '',
        label: '',
      ));

      expect(() async => await repositoryImp.getDetailsMoviesUpComming(),
          throwsA(isA<MovieUpComingError>()));
    });
    test('Should Throw NoInternetConnection throws DetailsMovieUpComingError ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(NoInternetConnection());

      expect(() async => await repositoryImp.getDetailsMoviesUpComming(),
          throwsA(isA<MovieUpComingNoInternetConnection>()));
    });
  });

  group('MovieRepositoryImp - Get All Movies Genres', () {
    test('Should return a list Movies Genres', () async {
      when(() => diohttpService.get(any())).thenAnswer((_) async => Response(
          data: responseJsonGenres, requestOptions: RequestOptions(path: '')));

      var result = await repositoryImp.getAllMoviesGenres();

      expect(result, isA<List<GenresMoviesModel>>());
      expect(result.length, 3);
    });

    test('Should Throw DioServiceError throws MovieGenresError', () async {
      when(() => diohttpService.get(any())).thenThrow(DioServiceError(
        errorMessage: '',
        exception: '',
        label: '',
      ));

      expect(() async => await repositoryImp.getAllMoviesGenres(),
          throwsA(isA<MovieGenresError>()));
    });
    test(
        'Should Throw NoInternetConnection throws MovieGenresNoInternetConnection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(NoInternetConnection());

      expect(() async => await repositoryImp.getAllMoviesGenres(),
          throwsA(isA<MovieGenresNoInternetConnection>()));
    });
  });
}
