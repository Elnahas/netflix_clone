import 'package:netflix_clone/core/models/movies_response.dart';
import 'package:netflix_clone/core/networking/api_error_handler.dart';
import 'package:netflix_clone/core/networking/api_result.dart';
import 'package:netflix_clone/core/networking/api_service.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<MoviesResponse>> getUpcomingMovies() async {
    try {
      final response = await _apiService.getUpcomingMovies();
      return Success(response);
    } catch (e) {
      final errorHandler = ErrorHandler.handle(e.toString());

      return Failure(errorHandler);
    }
  }


    Future<ApiResult<MoviesResponse>> getNowPlayingMovies() async {
    try {
      final response = await _apiService.getNowPlayingMovies();
      return Success(response);
    } catch (e) {
      final errorHandler = ErrorHandler.handle(e.toString());

      return Failure(errorHandler);
    }
  }
}
