import 'package:flutter_test/flutter_test.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/movie_model.dart';

import '../../../../mocks/mock.dart';

void main() {
  test('Shold convert Map to MovieModel ', () async {
    final result = MovieModel.fromJson(movieMap);

    expect(result, isA<MovieModel>());
    expect(result.id, 670981);
    expect(result.genreIds.length, 1);
    expect(result.genreIds.first, 18);
  });

  test('Shold convert MovieModel to Map', () {
    final map = movieModel.toJson();

    expect(map['id'], 670981);
    expect(map['genre_ids'][0], 18);
  });
}
