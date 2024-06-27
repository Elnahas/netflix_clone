import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/splash/ui/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Netflix Clone',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(surface: Colors.black),
          useMaterial3: true,
          fontFamily: GoogleFonts.ptSans().fontFamily,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
