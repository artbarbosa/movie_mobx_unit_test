import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_mobx_unit_test/app/core/failures/failures.dart';
import 'package:movie_mobx_unit_test/app/core/services/local/local_storage_service_interface.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/movie_model.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/services/local/movies_cache_service.dart';

import '../../../../../mocks/mock.dart';

class ILocalStorageServiceMock extends Mock implements ILocalStorageService {}

void main() {
  late MoviesCacheService moviesCacheService;
  late ILocalStorageService cache;

  setUpAll(() async {
    cache = ILocalStorageServiceMock();
    moviesCacheService = MoviesCacheService(cache: cache);
  });

  test('Should return list MovieModel ', () async {
    when(() => cache.getString(any())).thenAnswer((_) async => cacheMovies);

    final result =
        await moviesCacheService.getInCache('movies_test') as List<MovieModel>;

    expect(result, isA<List<MovieModel>>());
    expect(result.length, 1);
    expect(result[0].adult, false);
  });
  test('Should throws a NoDataFound', () async {
    when(() => cache.getString(any())).thenThrow((_) async => Exception());

    expect(() => moviesCacheService.getInCache('movies_test'),
        throwsA(isA<NoDataFound>()));
  });
}
