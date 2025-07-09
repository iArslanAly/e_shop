import 'package:e_shop/common/styles/shadows.dart';
import 'package:e_shop/common/widgets/customShapes/containers/circular_container.dart';
import 'package:e_shop/common/widgets/icons/circular_icon.dart';
import 'package:e_shop/common/widgets/text/product_price_text.dart';
import 'package:e_shop/common/widgets/text/product_title_text.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        // Handle product card tap
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ESizs.productImageRadius),
          color: dark ? EColors.darkerGrey : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ECircularContaiiner(
              width: 180,
              height: 180,
              padding: EdgeInsets.all(ESizs.sm),
              color: dark ? EColors.darkerGrey : Colors.white,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      ESizs.productImageRadius,
                    ),
                    child: Placeholder(
                      fallbackHeight: 180,
                      fallbackWidth: 180,
                      color: dark ? EColors.lightGrey : EColors.darkGrey,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 0,
                    child: ECircularContaiiner(
                      width: 50,
                      height: 30,
                      radius: ESizs.sm,
                      padding: EdgeInsets.symmetric(
                        horizontal: ESizs.sm,
                        vertical: ESizs.xs,
                      ),
                      color: EColors.secondary.withValues(alpha: 0.8),
                      child: Center(
                        child: Text(
                          '25%',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.apply(color: EColors.dark),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: ECircularIcons(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                      onPressed: () {
                        // Handle favorite action
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ESizs.spaceBtwItems / 2),

            /// Product Name and Price
            Padding(
              padding: const EdgeInsets.only(left: ESizs.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EProductTitleText(title: 'Product Name', smallSize: true),
                  const SizedBox(height: ESizs.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        'Brand',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium!.apply(color: EColors.darkGrey),
                      ),
                      const SizedBox(width: ESizs.sm),
                      Icon(Iconsax.verify5, size: 16, color: EColors.primary),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      EProductPriceText(
                        currencySign: '\$',
                        price: '99.99',
                        isLarge: true,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: EColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ESizs.sm),
                            bottomRight: Radius.circular(
                              ESizs.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: ESizs.icong * 1.2,
                          height: ESizs.icong * 1.2,
                          child: Icon(
                            Iconsax.add,
                            color: EColors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
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
