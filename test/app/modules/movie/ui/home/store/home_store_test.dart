import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/stores/genres_movie_store.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/stores/movies_up_comming_store.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/ui/home/store/home_store.dart';

import '../../../../../../mocks/mock.dart';

void main() {
  late HomeStore homeStore;
  late MovieUpCommingStore movieUpCommingStore;
  late GenresMovieStore genresMovieStore;
  late MovieRepositoryMock repository;
  late MoviesCacheServiceMock moviesCache;
  late GenresServiceMock genresCache;

  setUp(() {
    repository = MovieRepositoryMock();
    moviesCache = MoviesCacheServiceMock();
    genresCache = GenresServiceMock();
    genresMovieStore = GenresMovieStore(
      cache: genresCache,
      repository: repository,
    );
    movieUpCommingStore = MovieUpCommingStore(
      cache: moviesCache,
      repository: repository,
    );
    homeStore = HomeStore(
      genresMovieStore: genresMovieStore,
      movieUpCommingStore: movieUpCommingStore,
    );
  });

  test('HomeStoreTest', () async {
    when(() => repository.getMoviesUpComming(any()))
        .thenAnswer((_) async => listMovies);
  });

  homeStore.fetchMoviesUpComming();

  expect(homeStore.listMovieUpComming, isNotEmpty);
}
