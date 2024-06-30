import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/helpers/spacing.dart';
import 'package:netflix_clone/core/theming/app_colors.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_cubit.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_state.dart';
import 'package:netflix_clone/features/home/ui/widgets/slider_and_indicator_section.dart';

import '../../../../core/helpers/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Image.asset(
            'assets/icons/logo.png',
            height: 50.h,
            width: 120.w,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                )),
            horizontalSpace(5),
            CircleAvatar(
              radius: 18.r,
              backgroundImage: const NetworkImage(
                  Constants.profileUrl),
                  backgroundColor: Colors.white,
            ),
            horizontalSpace(15)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is PopularMoviesLoading ||
                    current is PopularMoviesSuccess ||
                    current is PopularMoviesFailure,
                builder: (context, state) {
                  if (state is PopularMoviesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PopularMoviesSuccess) {
                    return SliderAndIndicatorSection(list: state.movies.sublist(0, 5));
                    
                  } else if (state is PopularMoviesFailure) {
                    return Text(state.error);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ));
  }

  
}