
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:e_shop/utils/device/device_utility.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ESearchContainer extends StatelessWidget {
  const ESearchContainer({
    super.key,
    this.hintText,
    this.iconData,
    this.showBackground = true,
    this.showBorder = true, this.onTap,

  });
  final String? hintText;
  final IconData? iconData;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ESizs.defaultSpace),
        child: Container(
          width: EDeviceUtils.getScreenWidth(context),
          padding: EdgeInsets.all(ESizs.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                      ? EColors.dark
                      : EColors.light
                : EColors.transparent,
            borderRadius: BorderRadius.circular(ESizs.cardRadiusLg),
            border: showBorder ? Border.all(color: Colors.grey.shade300) : null,
          ),
      
          child: Row(
            children: [
              Icon(iconData, size: ESizs.iconSm, color: EColors.darkGrey),
              SizedBox(width: ESizs.spaceBtwItems),
              Text(
                ETextStrings.homeSearchHint,
                style: TextStyle(
                  fontSize: ESizs.fontSizeSm,
                  color: EColors.darkGrey,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.filter_list,
                size: ESizs.iconSm,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
