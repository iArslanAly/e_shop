import 'package:e_shop/common/widgets/imageText/vertcal_image_text.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/image_strings.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EHomeCategory extends StatelessWidget {
  const EHomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 7,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? ESizs.spaceBtwSections : 0,
              right: ESizs.spaceBtwItems,
            ),
            child: EVerticalImageText(
              image: EImages.sportIcon,
              text: 'Sports',
              textColor: EColors.light,
              backgroundColor: EColors.lightContainer,
              onTap: () {
                // Handle category tap
              },
            ),
          );
        },
      ),
    );
  }
}
