import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/helpers/font_weight_helper.dart';
import 'package:netflix_clone/core/theming/app_colors.dart';

abstract class AppTextStyles {

    static TextStyle font14WhiteBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.white
  );

    static TextStyle font10WhiteBold = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.white
  );

      static TextStyle font18WhiteBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.white
  );
}