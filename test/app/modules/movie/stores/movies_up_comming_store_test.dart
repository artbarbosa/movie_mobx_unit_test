import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_mobx_unit_test/app/core/failures/failures.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/errors/movie_failures.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/movie_model.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/stores/movies_up_comming_store.dart';

import '../../../../mocks/mock.dart';

void main() {
  late MovieUpCommingStore store;
  late MoviesCacheServiceMock cache;
  late MovieRepositoryMock repository;

  setUpAll(() {
    cache = MoviesCacheServiceMock();
    repository = MovieRepositoryMock();
    store = MovieUpCommingStore(
      cache: cache,
      repository: repository,
    );
  });

  group('MovieStore - fetchMoviesUpComming', () {
    test('Should return List MoviesModel', () async {
      when(() => repository.getDetailsMoviesUpComming())
          .thenAnswer((_) async => detailsMoviesUpCommingModel);
      when(() => repository.getMoviesUpComming(any()))
          .thenAnswer((_) async => listMovies);

      final result = await store.fetchMoviesUpComming();

      expect(result, isA<List<MovieModel>>());
      expect(store.listMoviesUpComming, isA<List<MovieModel>>());
      expect(store.listMoviesUpComming, result);
    });

    test(
        'Should throws cache List MoviesModel - MovieUpComingNoInternetConnection',
        () async {
      when(() => repository.getDetailsMoviesUpComming())
          .thenThrow(MovieUpComingNoInternetConnection());

      when(() => repository.getMoviesUpComming(any()))
          .thenThrow(MovieUpComingNoInternetConnection());

      when(() => cache.getInCache(any())).thenAnswer((_) async => listMovies);

      final result = await store.fetchMoviesUpComming();

      expect(result, isA<List<MovieModel>>());
    });
    test('Should throws cache List MoviesModel - MovieUpComingError', () async {
      when(() => repository.getDetailsMoviesUpComming())
          .thenThrow(MovieUpComingError(
        errorMessage: '',
        exception: '',
        label: '',
      ));
      when(() => repository.getMoviesUpComming(any()))
          .thenThrow(MovieUpComingError(
        errorMessage: '',
        exception: '',
        label: '',
      ));

      when(() => cache.getInCache(any())).thenAnswer((_) async => listMovies);

      final result = await store.fetchMoviesUpComming();

      expect(result, isA<List<MovieModel>>());
    });

    test('Should throws cache List MoviesModel - NoDataFound', () async {
      when(() => repository.getDetailsMoviesUpComming())
          .thenThrow(MovieUpComingNoInternetConnection());

      when(() => repository.getMoviesUpComming(any()))
          .thenThrow(MovieUpComingNoInternetConnection());

      when(() => cache.getInCache(any())).thenThrow(NoDataFound());

      expect(() async => await store.fetchMoviesUpComming(),
          throwsA(isA<NoDataFound>()));
    });
  });
}
