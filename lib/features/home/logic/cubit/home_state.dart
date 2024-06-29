
import 'package:netflix_clone/core/models/movies_response.dart';

sealed class HomeState {
  const HomeState();
}

class Initial extends HomeState {
  const Initial();
}


//UpcomingMovies

class UpcomingMoviesLoading extends HomeState {
  const UpcomingMoviesLoading();
}

class UpcomingMoviesSuccess extends HomeState {
  final List<MoviesModel> movies;
  const UpcomingMoviesSuccess(this.movies);
}

class UpcomingMoviesFailure extends HomeState {
  final String error;
  const UpcomingMoviesFailure(this.error);
}

//NowPlaying

class NowPlayingMoviesLoading extends HomeState {
  const NowPlayingMoviesLoading();
}

class NowPlayingMoviesSuccess extends HomeState {
  final List<MoviesModel> movies;
  const NowPlayingMoviesSuccess(this.movies);
}

class NowPlayingMoviesFailure extends HomeState {
  final String error;
  const NowPlayingMoviesFailure(this.error);
}