import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/helpers/spacing.dart';
import 'package:netflix_clone/core/models/genre_model.dart';
import 'package:netflix_clone/core/theming/app_colors.dart';
import 'package:netflix_clone/core/widgets/movie_item.dart';
import 'package:netflix_clone/features/home/ui/widgets/slider_section/slider_and_indicator_bloc_builder.dart';
import 'package:netflix_clone/features/home/ui/widgets/tab_bar_widget.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/models/movies_response.dart';
import '../../../../core/widgets/section_header.dart';
import '../widgets/tab_bar_bloc_builder.dart';
import '../widgets/upcoming_movie_bloc_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: genresList.length, initialIndex: 0, vsync: this);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

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
              backgroundImage: const NetworkImage(Constants.profileUrl),
              backgroundColor: Colors.white,
            ),
            horizontalSpace(15)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SliderAndIndicatorBlocBuilder(),
             TabBarWidget(tabController: _tabController),
              TabBarBlocBuilder(tabController: _tabController),
              verticalSpace(30),
              const UpcomingMovieBlocBuilder(),
            ],
          ),
        ));
  }
}
