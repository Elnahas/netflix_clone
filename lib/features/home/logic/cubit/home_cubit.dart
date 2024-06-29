import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/networking/api_result.dart';
import 'package:netflix_clone/features/home/data/repos/home_repo.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const Initial());

  Future<void> getUpcomingMovies() async {
    emit(const UpcomingMoviesLoading());

    final result = await _homeRepo.getUpcomingMovies();

    switch (result) {
      case Success(:final data):
        emit(UpcomingMoviesSuccess(data.moviesList));
        break;

      case Failure(:final errorHandler):
        emit(UpcomingMoviesFailure(errorHandler.apiErrorModel.message.toString()));
        break;
    }
  }
}
