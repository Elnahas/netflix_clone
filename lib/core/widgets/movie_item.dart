import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/core/helpers/extensions.dart';
import 'package:netflix_clone/core/networking/api_constants.dart';

import 'app_image_clip_r_rect.dart';

class MovieItem extends StatelessWidget {
  final String title;
  final String? poster;
  final double? rating;
  final Function()? onTap;

  const MovieItem({
    super.key,
    required this.title,
    required this.poster,
    required this.rating,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          top: 8.0,
          right: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AppImageClipRRect(
                  imageUrl: "${ApiConstants.baseImageUrl}$poster",
                  height: 180,
                  width: 120,
                  radius: 5,
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: const Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.3,
                      ),
                      highlightColor: const Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.1,
                      ),
                      onTap: onTap,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 120.h,
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
              ),
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          rating!.formatDouble().toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 4.0,
                          ),
                          child: RatingBar.builder(
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                            itemCount: 5,
                            ignoreGestures: true,
                            itemSize: 12.0,
                            initialRating: rating! / 2,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
