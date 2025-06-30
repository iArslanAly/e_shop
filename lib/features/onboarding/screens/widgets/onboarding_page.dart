// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import 'package:e_shop/utils/constants/sizes.dart';

import 'package:e_shop/utils/helpers/helper_functions.dart';

class OnboardiingPage extends StatelessWidget {
  const OnboardiingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ESizs.defaultSpace),
      child: Column(
        children: [
          Image(
            width: EHelperFunctions.screenWidth(context) * 8.0,
            height: EHelperFunctions.screenHeight(context) * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ESizs.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
