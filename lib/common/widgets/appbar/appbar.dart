import 'package:e_shop/utils/constants/sizes.dart';
import 'package:e_shop/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class EAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.onLeadingPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ESizs.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed:
                    onLeadingPressed ?? () => Navigator.of(context).pop(),
              )
            : leadingIcon != null
            ? IconButton(icon: Icon(leadingIcon), onPressed: onLeadingPressed)
            : null,
        title: title,
        actions: actions,
        centerTitle: false,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight());
}
