import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_mobx_unit_test/app/core/failures/failures.dart';
import 'package:movie_mobx_unit_test/app/core/services/local/local_storage_service_interface.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/genres_movies_model.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/services/local/genres_movies_cache_service.dart';

import '../../../../../mocks/mock.dart';

class ILocalStorageServiceMock extends Mock implements ILocalStorageService {}

void main() {
  late GenreMoviesCacheService genresCacheService;
  late ILocalStorageService cache;

  setUpAll(() async {
    cache = ILocalStorageServiceMock();
    genresCacheService = GenreMoviesCacheService(cache: cache);
  });

  test('Should return list MovieModel ', () async {
    when(() => cache.getString(any())).thenAnswer((_) async => cacheGenres);

    final result = await genresCacheService.getInCache('genres_test')
        as List<GenresMoviesModel>;

    expect(result, isA<List<GenresMoviesModel>>());
    expect(result.length, 1);
    expect(result.first.id, 28);
    expect(result.first.name, "Ação");
  });
  test('Should throws a NoDataFound', () async {
    when(() => cache.getString(any())).thenThrow((_) async => Exception());

    expect(() => genresCacheService.getInCache('genres_test'),
        throwsA(isA<NoDataFound>()));
  });
}
