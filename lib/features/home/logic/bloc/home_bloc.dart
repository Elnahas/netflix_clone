import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/models/movies_response.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repos/home_repo.dart';
import 'package:carousel_slider/carousel_slider.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _homeRepo;
  CarouselSliderController carouselController = CarouselSliderController();

  HomeBloc(this._homeRepo) : super( HomeInitial()) {
    on<GetPopularMovies>(_onGetPopularMovies);
    on<GetUpcomingMovies>(_onGetUpcomingMovies);
    on<GetNowPlayingMovies>(_onGetNowPlayingMovies);
    on<GetMoviesList>(_onGetMoviesList);
  }

  //this show popular movies in home screen at slider
  Future<void> _onGetPopularMovies(GetPopularMovies event, Emitter<HomeState> emit) async {
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



  // this method take genreId as parameter from tab and get list of movies
  Future<void> _onGetMoviesList(GetMoviesList event, Emitter<HomeState> emit) async {
    emit(const MoviesListLoading());

    final result = await _homeRepo.getMovieList(event.genreId);

    switch (result) {
      case Success(:final data):
        emit(MoviesListSuccess(data.moviesList));
        break;

      case Failure(:final errorHandler):
        emit(MoviesListFailure(
            errorHandler.apiErrorModel.message.toString()));
        break;
    }
  }



    Future<void> _onGetUpcomingMovies(GetUpcomingMovies event, Emitter<HomeState> emit) async {
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


  
  Future<void> _onGetNowPlayingMovies(GetNowPlayingMovies event, Emitter<HomeState> emit) async {
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


}