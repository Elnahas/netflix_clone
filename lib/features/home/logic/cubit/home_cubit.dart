import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/networking/api_result.dart';
import 'package:netflix_clone/features/home/data/repos/home_repo.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const Initial());

  CarouselSliderController carouselController = CarouselSliderController();

  Future<void> getPopularMovies() async {

    emit(const PopularMoviesLoading());

    final result = await _homeRepo.getPopularMovie();

    switch (result) {
      case Success(:final data):
        emit(PopularMoviesSuccess(data.moviesList));
        break;

      case Failure(:final errorHandler):
        emit(PopularMoviesFailure(
            errorHandler.apiErrorModel.message.toString()));
        break;
    }
  }

  Future<void> getUpcomingMovies() async {
    emit(const UpcomingMoviesLoading());

    final result = await _homeRepo.getUpcomingMovies();

    switch (result) {
      case Success(:final data):
        emit(UpcomingMoviesSuccess(data.moviesList));
        break;

      case Failure(:final errorHandler):
        emit(UpcomingMoviesFailure(
            errorHandler.apiErrorModel.message.toString()));
        break;
    }
  }

  Future<void> getNowPlayingMovies() async {
    emit(const NowPlayingMoviesLoading());

    final result = await _homeRepo.getNowPlayingMovies();

    switch (result) {
      case Success(:final data):
        emit(NowPlayingMoviesSuccess(data.moviesList));
        break;

      case Failure(:final errorHandler):
        emit(NowPlayingMoviesFailure(
            errorHandler.apiErrorModel.message.toString()));
        break;
    }
  }

  Future<void> getMovieList(int genreId) async {
    emit(const MoviesListLoading());

    final result = await _homeRepo.getMovieList(genreId);

    switch (result) {
      case Success(:final data):
        emit(MoviesListSuccess(data.moviesList));
        break;

      case Failure(:final errorHandler):
        emit(MoviesListFailure(errorHandler.apiErrorModel.message.toString()));
        break;
    }
  }
}
