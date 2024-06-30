import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/networking/api_constants.dart';
import 'package:netflix_clone/core/theming/app_text_styles.dart';

class SlideItems extends StatelessWidget {
  final String avatar;
  final String title;
  final Function()? onTap;

  const SlideItems(
      {super.key, required this.avatar, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(
                Rect.fromLTRB(
                  0,
                  0,
                  rect.width,
                  rect.height,
                ),
              );
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.baseImageUrl}$avatar',
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            )),

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

        Positioned(
          bottom: 30.0,
          left: 10.0,
          child: Text(
            title,
            style: AppTextStyles.font18WhiteBold,
          ),
        )
        
      ],
    );
  }
}
