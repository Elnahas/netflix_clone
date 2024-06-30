import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/models/movies_response.dart';
import 'package:netflix_clone/core/widgets/movie_item.dart';
import '../../../../core/models/genre_model.dart';

class TabBarViewWidget extends StatelessWidget {
  final List<MoviesModel> moviesList;
  final TabController tabController;
  const TabBarViewWidget({super.key, required this.moviesList, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: genresList.map((item) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              MoviesModel data =moviesList[index];
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
          );
        }).toList(),
      ),
    );
  }
}
