import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/movies_response.dart';
import '../../../../core/widgets/movie_item.dart';
import '../../../../core/widgets/section_header.dart';
import '../../logic/bloc/home_bloc.dart';

class UpcomingMovieBlocBuilder extends StatelessWidget {
  const UpcomingMovieBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState> (
      
      builder: (context, state) {
    
             if (state is UpcomingMoviesLoading) {
                  return  SizedBox(
                  height: 250,
                  child: Center(
                    child: Transform.scale(
                      scale: 0.7,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
                } else if (state is UpcomingMoviesSuccess) {

                  
                return  _upcomingMovie(state.movies);
                
                } else if (state is UpcomingMoviesFailure) {
                  return Text(state.error);
                }
                return const SizedBox.shrink();
        
    
    },);
  }

     _upcomingMovie(List<MoviesModel> upcomingMovie) {
    return Column(
      children: [
        const SectionHeader(
          title: 'Upcoming Movies',
          subtitle: 'See All',
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: upcomingMovie.length,
            itemBuilder: (context, index) {
              MoviesModel data = upcomingMovie[index];
              return MovieItem(
                title: data.title,
                poster: data.posterPath,
                rating: data.voteAverage,
                onTap: () => {},
              );
            },
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}