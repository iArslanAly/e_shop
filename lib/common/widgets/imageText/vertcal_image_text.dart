import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EVerticalImageText extends StatelessWidget {
  const EVerticalImageText({
    super.key,
    required this.image,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.onTap,
  });
  final String image, text;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final darkMode = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(ESizes.sm),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color:
                  backgroundColor ??
                  (darkMode ? EColors.darkerGrey : EColors.lightContainer),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image(
                image: AssetImage(image),
                width: 32,
                height: 32,
                fit: BoxFit.cover,
                color: darkMode ? EColors.light : EColors.dark,
              ),
            ),
          ),
          SizedBox(height: ESizes.spaceBtwItems / 2),
          SizedBox(
            width: 56,
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: textColor ?? EColors.light),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
