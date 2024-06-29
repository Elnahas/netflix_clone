import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/helpers/spacing.dart';
import 'package:netflix_clone/core/models/movies_response.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_cubit.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_state.dart';
import 'package:netflix_clone/features/home/ui/widgets/slide_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
              radius: 20.r,
              backgroundImage: const NetworkImage(
                  'https://media.licdn.com/dms/image/D4D03AQFmicEnnQAowg/profile-displayphoto-shrink_800_800/0/1719037982898?e=1724889600&v=beta&t=_4cazPwgUc51_HgWwWFxaeglKEDNJGhks59D_WZWHzA'),
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
                    return _buildCarouselSlider(state.movies);
                    
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

  
  _buildCarouselSlider(List<MoviesModel> list) {
    return CarouselSlider(
      items: list.sublist(0, 5).map(
        (item) {
          return SlideItems(
            avatar: item.backdropPath,
            title: item.title,
          );
        },
      ).toList(),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) {
          // setState(
          //   () {
          //     _current = index;
          //   },
          // );
        },
      ),
    );
  }

  
}