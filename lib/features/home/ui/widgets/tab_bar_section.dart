import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/helpers/extensions.dart';
import 'package:netflix_clone/core/models/movies_response.dart';
import 'package:netflix_clone/core/widgets/movie_item.dart';

import '../../../../core/models/genre_model.dart';

class TabBarSection extends StatefulWidget {
  final List<MoviesModel> moviesList;
  const TabBarSection({super.key, required this.moviesList});

  @override
  State<TabBarSection> createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: genresList.length,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_handleTabIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildTabBar(), _buildTabBarView(widget.moviesList)],
    );
  }

  _buildTabBar() {
    return TabBar(
      controller: _tabController,
      onTap: (index) {},
      labelColor: Colors.white,
      indicatorWeight: 3,
      indicatorColor: Colors.white,
      isScrollable: true,
      labelStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
      ),
      tabs: genresList.map(
        (item) {
          return Tab(
            text: item.name.toUpperCase(),
          );
        },
      ).toList(),
    );
  }

  _buildTabBarView(List<MoviesModel> genreListMovies) {
    return SizedBox(
      height: 270.h,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: genresList.map((item) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genreListMovies.length,
            itemBuilder: (context, index) {
              MoviesModel data = genreListMovies[index];
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
