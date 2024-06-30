import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppImageClipRRect extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final double height;
  final double width;
  final Widget errorWidget;

  const AppImageClipRRect({
    super.key,
    required this.imageUrl,
    this.radius = 12,
    this.errorWidget = const Icon(Icons.error),
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        height: height.h,
        width: width.w,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.grey,
            height: height.h,
            width: width.w,
          ),
        ),
        errorWidget: (context, url, error) => errorWidget,
      ),
    );
  }
}
