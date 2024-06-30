import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_cubit.dart';
import 'package:netflix_clone/features/home/ui/widgets/tab_bar_view_widget.dart';

import '../../logic/cubit/home_state.dart';

class TabBarBlocBuilder extends StatelessWidget {
  final TabController tabController;
  const TabBarBlocBuilder({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is MoviesListLoading) {
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
                  } else if (state is MoviesListSuccess) {
                    return TabBarViewWidget(moviesList: state.movies ,tabController:  tabController);
                  } else if (state is MoviesListFailure) {
                    return Text(state.error);
                    
                  }
                  return const SizedBox.shrink();
                },
              );
  }
}