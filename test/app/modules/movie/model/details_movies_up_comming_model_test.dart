import 'package:flutter_test/flutter_test.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/details_movies_up_comming_model.dart';

import '../../../../mocks/mock.dart';

void main() {
  test('Shold convert Map to DetailsMoviesUpCommingModel ', () async {
    final result =
        DetailsMoviesUpCommingModel.fromJson(detailsMoviesUpCommingMap);

    expect(result, isA<DetailsMoviesUpCommingModel>());
    expect(result.totalPages, 23);
    expect(result.totalResults, 443);
  });

  test('Shold convert DetailsMoviesUpCommingModel to Map', () {
    final map = detailsMoviesUpCommingModel.toJson();

    expect(map['total_pages'], 23);
    expect(map['total_results'], 443);
  });
}
