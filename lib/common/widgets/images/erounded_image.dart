import 'package:e_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ERoundedImage extends StatelessWidget {
  const ERoundedImage({
    super.key,
    this.width = 150,
    this.height = 158,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    required this.backgroundColor,
    this.fit,
    this.padding,
    this.isNetworkImage = false,
    this.onTap,
    this.borderRadius = ESizes.md,
  });
  final double width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
