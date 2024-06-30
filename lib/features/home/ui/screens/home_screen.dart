import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/helpers/spacing.dart';
import 'package:netflix_clone/core/theming/app_colors.dart';
import 'package:netflix_clone/features/home/ui/widgets/slider_section/slider_and_indicator_bloc_builder.dart';
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
        body: const SingleChildScrollView(
          child: Column(
            children: [

              SliderAndIndicatorBlocBuilder()

            ],
          ),
        ));
  }

  
}