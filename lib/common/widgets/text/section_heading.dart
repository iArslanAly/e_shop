import 'package:e_shop/utils/constants/colors.dart';
import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class ESectionHeading extends StatelessWidget {
  const ESectionHeading({
    super.key,
    required this.textColor,
    required this.showActionButton,
    this.actionButtonText,
    required this.title,
    this.onActionButtonPressed,
  });
  final Color textColor;
  final bool showActionButton;
  final String? actionButtonText, title;
  final VoidCallback? onActionButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ESizs.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: EColors.grey,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showActionButton)
            TextButton(
              onPressed: onActionButtonPressed,
              child: Text(
                actionButtonText ?? ETextStrings.homeViewAll,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.apply(color: EColors.grey),
              ),
            ),
        ],
      ),
    );
  }
}
