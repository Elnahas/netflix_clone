import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/models/movies_response.dart';
import 'package:netflix_clone/features/home/logic/cubit/home_cubit.dart';
import 'package:netflix_clone/features/home/ui/widgets/slider_section/slide_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/theming/app_colors.dart';

class SliderAndIndicatorSection extends StatefulWidget {
  final List<MoviesModel> list;
  const SliderAndIndicatorSection({super.key, required this.list});

  @override
  State<SliderAndIndicatorSection> createState() =>
      _SliderAndIndicatorSectionState();
}

class _SliderAndIndicatorSectionState extends State<SliderAndIndicatorSection> {
  late CarouselController carouselController;

  int currentIndex = 0;

  @override
  void initState() {
    carouselController = context.read<HomeCubit>().carouselController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //Slider
      CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1,
          enlargeCenterPage: false,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
          scrollDirection: Axis.horizontal,
        ),
        items: widget.list.map(
          (item) {
            return SlideItems(
              avatar: item.backdropPath,
              title: item.title,
            );
          },
        ).toList(),
      ),

      // Indicators
      Positioned(
        left: 0,
        right: 0,
        bottom: 5.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: widget.list.length,
                axisDirection: Axis.horizontal,
                effect: const WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: AppColors.paleRed),
                onDotClicked: (index) {
                  setState(() {
                    currentIndex = index;
                    carouselController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  });
                }),
          ],
        ),
      )
    ]);
  }
}
