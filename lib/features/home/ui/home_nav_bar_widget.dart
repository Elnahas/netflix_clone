import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/di/service_locator.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_cubit.dart';
import 'package:netflix_clone/features/home/ui/screens/home_screen.dart';
import 'package:netflix_clone/features/new_hot/ui/screens/new_hot_screen.dart';
import 'package:netflix_clone/features/search/ui/screens/search_screen.dart';

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          child: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff999999),
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: "New & Hot",
              ),
            ],
          ),
        ),
        body:  TabBarView(children: [
          BlocProvider(
            create: (context) => HomeCubit(getIt())..getUpcomingMovies(),
            child: const HomeScreen(),
          ),
          const SearchScreen(),
          const NewHotScreen(),
        ]),
      ),
    );
  }
}
