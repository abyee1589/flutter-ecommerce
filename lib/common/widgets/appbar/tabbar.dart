import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/device/device_utility.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbTabBar extends StatelessWidget implements PreferredSizeWidget{
  const AbTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? AbColors.black : AbColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AbColors.primary,
        labelColor: dark ? AbColors.white : AbColors.black,
        unselectedLabelColor: AbColors.darkGrey,
        ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AbDeviceUtils.getAppBarHeight());
}