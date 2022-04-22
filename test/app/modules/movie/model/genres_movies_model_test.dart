import 'package:flutter_test/flutter_test.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/genres_movies_model.dart';

import '../../../../mocks/mock.dart';

void main() {
  test('Shold convert Map to GenresMoviesModel ', () async {
    final result = GenresMoviesModel.fromJson(genreMap);

    expect(result, isA<GenresMoviesModel>());
    expect(result.id, 28);
    expect(result.name, "Ação");
  });

  test('Shold convert GenresMoviesModel to Map', () {
    final map = genreModel.toJson();

    expect(map['id'], 28);
    expect(map['name'], "Ação");
  });
}
