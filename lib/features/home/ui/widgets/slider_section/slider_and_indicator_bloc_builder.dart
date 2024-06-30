import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_cubit.dart';

import '../../../logic/cubit/home_state.dart';
import 'slider_and_indicator_section.dart';

class SliderAndIndicatorBlocBuilder extends StatelessWidget {
  const SliderAndIndicatorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is PopularMoviesLoading ||
          current is PopularMoviesSuccess ||
          current is PopularMoviesFailure,
      builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return  SizedBox(
            height: 200.h,
            child: const Center(
              child:  CircularProgressIndicator(),
            ),
          );
        } else if (state is PopularMoviesSuccess) {
          return SliderAndIndicatorSection(list: state.movies.sublist(0, 5));
        } else if (state is PopularMoviesFailure) {
          return Text(state.error);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
