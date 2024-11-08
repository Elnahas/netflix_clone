import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/di/service_locator.dart';
import 'package:netflix_clone/core/routing/routes.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_cubit.dart';
import 'package:netflix_clone/features/home/ui/home_nav_bar_widget.dart';
import 'package:netflix_clone/features/home/ui/screens/home_screen.dart';
import 'package:netflix_clone/features/learn/learn_screen.dart';
import 'package:netflix_clone/features/splash/ui/splash_screen.dart';

import '../../features/home/logic/bloc/home_bloc.dart';
import '../../features/learn/bloc/counter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => 
                  HomeBloc(getIt())..add(GetPopularMovies())
                  ..add(const GetMoviesList(28))

                  
                  // HomeCubit(getIt())
                  //   ..getPopularMovies()
                  //   ..getMovieList(28)

                    ,
                  child: const HomeScreen(),
                ));


      case Routes.homeNavBar:
        return MaterialPageRoute(
            builder: (context) => const HomeNavBarWidget());
      case Routes.learn:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => CounterBloc(),
                  child: const LearnScreen(),
                ));
              
      default:
        return null;
    }
  }
}
