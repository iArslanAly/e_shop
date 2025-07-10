import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:e_shop/common/styles/shadows.dart';
import 'package:e_shop/common/widgets/customShapes/containers/circular_container.dart';
import 'package:e_shop/common/widgets/icons/circular_icon.dart';
import 'package:e_shop/common/widgets/text/product_price_text.dart';
import 'package:e_shop/common/widgets/text/product_title_text.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/helpers/helper_functions.dart';

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
        width: ESizes.d180dp,
        padding: const EdgeInsets.all(ESizes.d1dp),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(ESizes.productImageRadius),
          color: dark ? EColors.darkerGrey : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ECircularContaiiner(
              width: ESizes.d180dp,
              height: ESizes.d180dp,
              padding: EdgeInsets.all(ESizes.sm),
              color: dark ? EColors.darkerGrey : Colors.white,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      ESizes.productImageRadius,
                    ),
                    child: Placeholder(
                      fallbackHeight: ESizes.d180dp,
                      fallbackWidth: ESizes.d180dp,
                      color: dark ? EColors.lightGrey : EColors.darkGrey,
                    ),
                  ),
                  Positioned(
                    top: ESizes.d12dp,
                    left: ESizes.d0dp,
                    child: ECircularContaiiner(
                      width: ESizes.d50dp,
                      height: ESizes.d30dp,
                      radius: ESizes.sm,
                      padding: EdgeInsets.symmetric(
                        horizontal: ESizes.sm,
                        vertical: ESizes.xs,
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
                    right: ESizes.d0dp,
                    top: ESizes.d0dp,
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
            const SizedBox(height: ESizes.spaceBtwItems / 2),

            /// Product Name and Price
            Padding(
              padding: const EdgeInsets.only(left: ESizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EProductTitleText(title: 'Product Name', smallSize: true),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        'Brand',
                        overflow: TextOverflow.ellipsis,
                        maxLines: ESizes.d1,
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium!.apply(color: EColors.darkGrey),
                      ),
                      const SizedBox(width: ESizes.sm),
                      Icon(
                        Iconsax.verify5,
                        size: ESizes.iconMd,
                        color: EColors.primary,
                      ),
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
                            topLeft: Radius.circular(ESizes.sm),
                            bottomRight: Radius.circular(
                              ESizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: ESizes.iconLg * ESizes.onePointTwo,
                          height: ESizes.iconLg * ESizes.onePointTwo,
                          child: Icon(
                            Iconsax.add,
                            color: EColors.white,
                            size: ESizes.iconMd,
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
