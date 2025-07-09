
import 'package:e_shop/common/widgets/appbar/appbar.dart';
import 'package:e_shop/common/widgets/products/cart/cart_manu_icon.dart';
import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class EHomeAppBar extends StatelessWidget {
  const EHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            ETextStrings.homeAppBarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: EColors.grey),
          ),
    
          Text(
            ETextStrings.homeAppBarSubtitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: EColors.grey),
          ),
        ],
      ),
      actions: [
        ECartCounterIcon(
          iconColor: EColors.black,
          onPressed: () {
            // Handle cart icon press
          },
          cartCount: '3',
        ),
      ],
    );
  }
}
