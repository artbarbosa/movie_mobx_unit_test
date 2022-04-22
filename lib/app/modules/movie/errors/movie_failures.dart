import '../../../core/failures/failures.dart';

class MovieUpComingNoInternetConnection extends NoInternetConnection {}

class MovieUpComingError extends Failure {
  MovieUpComingError({
    StackTrace? stackTrace,
    required String? label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}

class MovieGenresNoInternetConnection extends NoInternetConnection {}

class MovieGenresError extends Failure {
  MovieGenresError({
    StackTrace? stackTrace,
    required String label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}
