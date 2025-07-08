import 'package:e_shop/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class EAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size.fromHeight(EDeviceUtils.getAppBarHeight());
}
