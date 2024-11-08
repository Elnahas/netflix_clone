part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}


//PopularMovies
class PopularMoviesLoading extends HomeState {
  const PopularMoviesLoading();
}

class PopularMoviesSuccess extends HomeState {
  final List<MoviesModel> movies;
  const PopularMoviesSuccess(this.movies);
}

class PopularMoviesFailure extends HomeState {
  final String error;
  const PopularMoviesFailure(this.error);
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


//Movie List

class MoviesListLoading extends HomeState {
  const MoviesListLoading();
}

class MoviesListSuccess extends HomeState {
  final List<MoviesModel> movies;
  const MoviesListSuccess(this.movies);
}

class MoviesListFailure extends HomeState {
  final String error;
  const MoviesListFailure(this.error);
}