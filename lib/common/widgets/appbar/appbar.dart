import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/device/device_utility.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AbAppBar({super.key,
   this.title, 
  this.showBackArrow = false, 
  this.leadingIcon,
  this.actions,
  this.onLeadingIconPressed,
});


  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onLeadingIconPressed;


  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AbSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
        ? IconButton(onPressed: (() => Get.back()), icon: Icon(Iconsax.arrow_left, color: dark ? AbColors.white : AbColors.black,))
        : leadingIcon != null ? IconButton(onPressed: onLeadingIconPressed, icon: Icon(leadingIcon)) : null,
        title: title,
        actions: actions,
      ),
    );
  }
  
  @override
  
  Size get preferredSize => Size.fromHeight(AbDeviceUtils.getAppBarHeight());
}