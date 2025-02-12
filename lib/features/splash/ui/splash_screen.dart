import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/core/helpers/extensions.dart';
import 'package:netflix_clone/core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.pushReplacementNamed(Routes.home);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/netflix.json',
        controller: _controller,
        onLoaded: (composition) {
          _controller.duration = composition.duration;
          _controller.forward();
        },
        repeat: false,
      ),
    );
  }
}
