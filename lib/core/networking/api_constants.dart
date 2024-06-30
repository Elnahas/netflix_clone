import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final String userToken = dotenv.get("API_TOKEN", fallback: "");
  static const String apiBaseUrl = "https://api.themoviedb.org/3/";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500/";

  static const String movieUpcoming = "movie/upcoming";
  static const String popularMovie = "movie/popular";
  static const String nowPlaying = "movie/now_playing";
  static const String discoverMovieList = "discover/movie";
  static const String genreList = "genre/movie/list";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
