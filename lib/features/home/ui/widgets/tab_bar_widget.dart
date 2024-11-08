import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/genre_model.dart';
import '../../logic/bloc/home_bloc.dart';

class TabBarWidget extends StatelessWidget {
  final TabController tabController;
  const TabBarWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return  TabBar(
      controller: tabController,
      onTap: (index) {
        context.read<HomeBloc>().add(GetMoviesList(genresList[index].id));

      },
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
}