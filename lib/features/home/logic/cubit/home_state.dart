
import 'package:netflix_clone/core/models/movies_response.dart';

sealed class HomeState {
  const HomeState();
}

class Initial extends HomeState {
  const Initial();
}

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