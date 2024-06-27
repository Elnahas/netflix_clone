import 'package:flutter/material.dart';
import 'package:netflix_clone/core/routing/routes.dart';
import 'package:netflix_clone/features/home/ui/home_nav_bar_widget.dart';
import 'package:netflix_clone/features/home/ui/screens/home_screen.dart';
import 'package:netflix_clone/features/splash/ui/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.homeNavBar:
        return MaterialPageRoute(builder: (context) => const HomeNavBarWidget());
      default:
        return null;
    }
  }
}
