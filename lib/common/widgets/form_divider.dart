// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_shop/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:e_shop/utils/constants/sizes.dart';

class EFormDivider extends StatelessWidget {
  const EFormDivider({super.key, this.text});

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            thickness: ESizs.dividerHeight,
            endIndent: ESizs.defaultSpace,
            indent: ESizs.defaultSpace,
            color: EColors.darkGrey,
          ),
        ),
        Text(
          text ?? '',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: EColors.darkGrey),
        ),
        Flexible(
          child: Divider(
            thickness: ESizs.dividerHeight,
            endIndent: ESizs.defaultSpace,
            indent: ESizs.defaultSpace,
            color: EColors.darkGrey,
          ),
        ),
      ],
    );
  }
}
