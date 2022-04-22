import 'package:movie_mobx_unit_test/app/core/failures/failures.dart';

import '../../../core/consts/api_consts.dart';
import '../../../core/services/remote/http_client_service.dart';
import '../errors/movie_failures.dart';
import '../model/details_movies_up_comming_model.dart';
import '../model/genres_movies_model.dart';
import '../model/movie_model.dart';
import 'movie_repository_interface.dart';

class MovieRepositoryImp implements IMovieRepository {
  final IHttpClientService httpService;

  MovieRepositoryImp({required this.httpService});

  @override
  Future<List<MovieModel>> getMoviesUpComming(int page) async {
    try {
      final response =
          await httpService.get(ApiConst.moviesUpComming(page: page));
      final list = response.data['results'] as List<dynamic>;
      return list.map((e) => MovieModel.fromJson(e)).toList();
    } on NoInternetConnection catch (e) {
      throw MovieUpComingNoInternetConnection();
    } on DioServiceError catch (e, stackTrace) {
      throw MovieUpComingError(
        stackTrace: stackTrace,
        label: 'MovieRepositoryImp-getMovieUpComming',
        exception: e.toString(),
        errorMessage: e.errorMessage,
      );
    }
  }

  @override
  Future<DetailsMoviesUpCommingModel> getDetailsMoviesUpComming() async {
    try {
      final response = await httpService.get(ApiConst.moviesUpComming());
      return DetailsMoviesUpCommingModel(
        totalPages: response.data['total_pages'],
        totalResults: response.data['total_results'],
      );
    } on NoInternetConnection catch (e) {
      throw MovieUpComingNoInternetConnection();
    } on DioServiceError catch (e, stackTrace) {
      throw MovieUpComingError(
        stackTrace: stackTrace,
        label: 'MovieRepositoryImp-getTotalPagesMoviesUpComming',
        exception: e.toString(),
        errorMessage: e.errorMessage,
      );
    }
  }

  @override
  Future<List<GenresMoviesModel>> getAllMoviesGenres() async {
    try {
      final response = await httpService.get(ApiConst.fetchGenre());
      final list = response.data['genres'] as List<dynamic>;
      return list.map((e) => GenresMoviesModel.fromJson(e)).toList();
    } on NoInternetConnection catch (e) {
      throw MovieGenresNoInternetConnection();
    } on DioServiceError catch (e, stackTrace) {
      throw MovieGenresError(
        stackTrace: stackTrace,
        label: 'MovieRepositoryImp-getMovieUpComming',
        exception: e.toString(),
        errorMessage: e.errorMessage,
      );
    }
  }
}
