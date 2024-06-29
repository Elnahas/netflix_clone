import 'package:dio/dio.dart';
import 'package:netflix_clone/core/models/movies_response.dart';
import 'package:netflix_clone/core/networking/api_constants.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService{
  
  factory ApiService(Dio dio , {String baseUrl}) = _ApiService;

  @GET(ApiConstants.movieUpcoming)
  Future<MoviesResponse> getUpcomingMovies(
  );
  @GET(ApiConstants.nowPlaying)
  Future<MoviesResponse> getNowPlayingMovies(
  );

    @GET(ApiConstants.popularMovie)
  Future<MoviesResponse> getPopularMovie(
  );

}
