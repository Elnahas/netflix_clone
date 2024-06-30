import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/routing/app_router.dart';
import 'package:netflix_clone/core/routing/routes.dart';
import 'package:netflix_clone/core/theming/app_colors.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Netflix Clone',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.dark,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
              bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,  
            ),
            scaffoldBackgroundColor: AppColors.primaryColor,
            useMaterial3: true,
            fontFamily: GoogleFonts.ptSans().fontFamily,
          ),
          // home: const SplashScreen(),
          initialRoute: Routes.splash,
          onGenerateRoute: appRouter.onGenerateRoute,
        );
      },
    );
  }
}