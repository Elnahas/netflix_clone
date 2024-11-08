part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

// Popular Movies
class GetPopularMovies extends HomeEvent {
}

// Upcoming Movies
class GetUpcomingMovies extends HomeEvent {
}

// Now Playing Movies
class GetNowPlayingMovies extends HomeEvent {
}

// Movies List by Genre
class GetMoviesList extends HomeEvent {
  final int genreId;
  const GetMoviesList(this.genreId);

  @override
  List<Object?> get props => [genreId];
}