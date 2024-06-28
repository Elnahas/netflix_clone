import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/helpers/spacing.dart';

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.search , size: 30,)),

        horizontalSpace(5),

          CircleAvatar(
            radius: 20.r,
            backgroundImage: const NetworkImage(
                'https://media.licdn.com/dms/image/D4D03AQFmicEnnQAowg/profile-displayphoto-shrink_800_800/0/1719037982898?e=1724889600&v=beta&t=_4cazPwgUc51_HgWwWFxaeglKEDNJGhks59D_WZWHzA'),
          ),
          horizontalSpace(15)
          
        ],
      ),
    );
  }
}
