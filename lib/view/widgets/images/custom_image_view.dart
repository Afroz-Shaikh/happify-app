import 'package:flutter/material.dart';

/// THIS IS THE CLASS FOR SHOW IMAGES...

class CustomImageView extends StatelessWidget {
  final String? imageUrl;
  final bool? isFromAssets;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadius? radius;

  const CustomImageView(
      {Key? key,
      this.imageUrl,
      this.isFromAssets = true,
      this.height,
      this.width,
      this.fit,
      this.radius})
      : assert(imageUrl != "" && imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: radius ?? BorderRadius.circular(0),
        child: isFromAssets ?? true
            ? Image.asset(
                imageUrl!,
                height: height ?? null,
                width: width ?? null,
                fit: fit ?? BoxFit.contain,
              )
            : Image.network(
                imageUrl!,
                height: height ?? null,
                width: width ?? null,
                fit: fit ?? BoxFit.contain,
              ));
  }
}
