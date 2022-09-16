import 'package:flutter/material.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/utils/dimensions.dart';

class ImageView extends StatelessWidget {
  const ImageView(
    this.image, {
    super.key,
    this.errorHolder,
    this.borderRadius,
    this.height,
    this.width,
  });

  final String? image;
  final String? errorHolder;
  final BorderRadius? borderRadius;
  final double? height, width;

  ImageProvider<Object> get _image {
    if (image?.contains('http') == true) {
      return NetworkImage(image ?? '');
    } else {
      return AssetImage(image ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? Dimensions.radius10,
      child: SizedBox(
        height: height,
        width: width,
        child: Image(
          image: _image,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                ),
              );
            }
          },
          // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          //   if (wasSynchronouslyLoaded) {
          //     return child;
          //   }
          //   return AnimatedOpacity(
          //     opacity: wasSynchronouslyLoaded ? 0 : 1,
          //     duration: const Duration(seconds: 3),
          //     curve: Curves.easeOut,
          //     child: child,
          //   );
          // },
          errorBuilder: (context, error, stackTrace) => Image.asset(
            errorHolder ?? Assets.assetsImagesSplashBg,
            fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
            alignment: Alignment.bottomCenter,
          ),
          height: height ?? double.maxFinite,
          width: width ?? double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
