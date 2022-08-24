import 'package:flutter/material.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/utils/dimensions.dart';

class ImageView extends StatelessWidget {
  const ImageView(this.image, {super.key, this.errorHolder, this.borderRadius});

  final String? image, errorHolder;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? Dimensions.radius10,
      child: Image.network(
        '$image',

        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
            ),
          );
        },
        // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        //   if (wasSynchronouslyLoaded) {
        //     return child;
        //   }
        //   return AnimatedOpacity(
        //     child: child,
        //     opacity: wasSynchronouslyLoaded ? 0 : 1,
        //     duration: const Duration(seconds: 3),
        //     curve: Curves.easeOut,
        //   );
        // },
        errorBuilder: (context, error, stackTrace) => Image.asset(
          errorHolder ?? Assets.assetsImagesSplashBg,
          fit: BoxFit.cover,
          height: double.maxFinite,
          width: double.maxFinite,
          alignment: Alignment.bottomCenter,
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        fit: BoxFit.cover,
      ),
    );
  }
}
