import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/di/service_locator.dart';
import 'package:netflix_clone/core/networking/api_service.dart';
import 'package:netflix_clone/core/routing/app_router.dart';
import 'package:netflix_clone/my_app.dart';

void main() async {
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  await dotenv.load(fileName: ".env");
  await getIt<ApiService>().getMovieUpcoming();

  runApp(MyApp(appRouter: AppRouter()));
}
