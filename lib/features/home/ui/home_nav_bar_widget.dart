import 'package:flutter/material.dart';
import 'package:netflix_clone/features/home/ui/screens/home_screen.dart';

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
        body: const TabBarView(children: [
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ]),
      ),
    );
  }
}
