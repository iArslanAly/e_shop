import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/customShapes/containers/primery_hader_container.dart';
import '../../../common/widgets/customShapes/containers/search_container.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../common/widgets/products/productCards/product_card_vertical.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../widgets/hom_category.dart';
import '../widgets/home_appbar.dart';
import '../widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          /// header
          children: [
            EPrimeryHeeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  EHomeAppBar(),
                  SizedBox(height: ESizes.spaceBtwSections),

                  /// searchbar
                  ESearchContainer(
                    hintText: ETextStrings.homeSearchHint,
                    iconData: Iconsax.search_normal,
                    onTap: () {
                      /// Handle search container tap
                    },
                  ),
                  SizedBox(height: ESizes.spaceBtwSections),

                  /// Categoris
                  ESectionHeading(
                    textColor: EColors.grey,
                    showActionButton: false,
                    title: ETextStrings.homeCategoriesTitle,
                  ),
                  SizedBox(height: ESizes.spaceBtwItems),
                  EHomeCategory(),
                ],
              ),
            ),

            /// Promo Slider
            Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: EPromoSlider(
                images: [EImages.banner1, EImages.banner2, EImages.banner3],
              ),
            ),
            SizedBox(height: ESizes.spaceBtwSections),

            /// items section
            EGridLayout(
              itemBuilder: (context, index) => const EProductCardVertical(),
              itemCount: 20,
            ),
          ],
        ),
      ),
    );
  }
}
