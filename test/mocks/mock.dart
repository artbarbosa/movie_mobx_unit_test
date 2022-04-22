import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_mobx_unit_test/app/core/services/remote/dio_http_client_service.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/details_movies_up_comming_model.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/genres_movies_model.dart';
import 'package:movie_mobx_unit_test/app/modules/movie/model/movie_model.dart';

class DioMock extends Mock implements Dio {}

class ResponseMock extends Mock implements Response {}

class DioHttpServiceMock extends Mock implements DioHttpServiceImp {}

var movieMap = {
  "adult": false,
  "backdrop_path": "/yGlUHuSUdsfy5GYxW42w95RpIms.jpg",
  "genre_ids": [18],
  "id": 670981,
  "original_language": "es",
  "original_title": "Noche de fuego",
  "overview":
      "In a mountain town, where corn and poppies grow, the girls wear boyish haircuts and have hiding places underground to escape the threat of being stolen. Ana and her two best friends grow up together, affirming the bonds of their friendship and discovering what it means to be women in a rural town marked by violence. Their mothers train them to flee death, to escape those who turn them into slaves or ghosts. They create their own impenetrable universe, but one day one of the girls doesn’t make it to her hiding place in time.",
  "popularity": 38.082,
  "poster_path": "/kb0IrVB4bDzBilRNpDv1OPMCs3u.jpg",
  "release_date": "2021-09-16",
  "title": "Prayers for the Stolen",
  "video": false,
  "vote_average": 8.1,
  "vote_count": 53
};

final movieModel = MovieModel(
  adult: false,
  genreIds: [18],
  id: 670981,
  originalLanguage: "es",
  originalTitle: "Noche de fuego",
  overview:
      "In a mountain town, where corn and poppies grow, the girls wear boyish haircuts and have hiding places underground to escape the threat of being stolen. Ana and her two best friends grow up together, affirming the bonds of their friendship and discovering what it means to be women in a rural town marked by violence. Their mothers train them to flee death, to escape those who turn them into slaves or ghosts. They create their own impenetrable universe, but one day one of the girls doesn’t make it to her hiding place in time.",
  popularity: 38.082,
  releaseDate: "2021-09-16",
  title: "Prayers for the Stolen",
  video: false,
  voteAverage: 8.1,
  voteCount: 53,
);

var genreMap = {
  "id": 28,
  "name": "Ação",
};

var genreModel = GenresMoviesModel(
  id: 28,
  name: "Ação",
);

var detailsMoviesUpCommingMap = {
  "total_pages": 23,
  "total_results": 443,
};

var detailsMoviesUpCommingModel = DetailsMoviesUpCommingModel(
  totalPages: 23,
  totalResults: 443,
);

Map<String, dynamic> responseJsonMovies = {
  "dates": {"maximum": "2022-04-01", "minimum": "2022-03-07"},
  "page": 3,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/yGlUHuSUdsfy5GYxW42w95RpIms.jpg",
      "genre_ids": [18],
      "id": 670981,
      "original_language": "es",
      "original_title": "Noche de fuego",
      "overview":
          "In a mountain town, where corn and poppies grow, the girls wear boyish haircuts and have hiding places underground to escape the threat of being stolen. Ana and her two best friends grow up together, affirming the bonds of their friendship and discovering what it means to be women in a rural town marked by violence. Their mothers train them to flee death, to escape those who turn them into slaves or ghosts. They create their own impenetrable universe, but one day one of the girls doesn’t make it to her hiding place in time.",
      "popularity": 38.082,
      "poster_path": "/kb0IrVB4bDzBilRNpDv1OPMCs3u.jpg",
      "release_date": "2021-09-16",
      "title": "Prayers for the Stolen",
      "video": false,
      "vote_average": 8.1,
      "vote_count": 53
    },
    {
      "adult": false,
      "backdrop_path": "/ik9SVGcYxKg6y2a9cW0e0WchImW.jpg",
      "genre_ids": [28, 12, 18],
      "id": 639933,
      "original_language": "en",
      "original_title": "The Northman",
      "overview":
          "A young Viking prince embarks on a quest to avenge his father’s murder.",
      "popularity": 36.793,
      "poster_path": "/uTu1bsfDWtV1EA4DR43HdFtNQbd.jpg",
      "release_date": "2022-03-31",
      "title": "The Northman",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
  ],
  "total_pages": 23,
  "total_results": 443
};

Map<String, dynamic> responseJsonGenres = {
  "genres": [
    {"id": 28, "name": "Ação"},
    {"id": 12, "name": "Aventura"},
    {"id": 16, "name": "Animação"},
  ]
};

var cacheMovies =
    '''[{"adult":false,"backdrop_path":"yGlUHuSUdsfy5GYxW42w95RpIms","genre_ids":[18],"id":670981,"original_language":"es","original_title":"Noche de fuego","overview":"In a mountain town, where corn and poppies grow, the girls wear boyish haircuts and have hiding places underground to escape the threat of being stolen. Ana and her two best friends grow up together, affirming the bonds of their friendship and discovering what it means to be women in a rural town marked by violence. Their mothers train them to flee death, to escape those who turn them into slaves or ghosts. They create their own impenetrable universe, but one day one of the girls doesn’t make it to her hiding place in time.","popularity":38.082,"poster_path":"/kb0IrVB4bDzBilRNpDv1OPMCs3u.jpg","release_date":"2021-09-16","title":"Prayers for the Stolen","video":false,"vote_average":8.1,"vote_count":53}]''';

var cacheGenres = '''[{"id":28,"name":"Ação"}]''';
