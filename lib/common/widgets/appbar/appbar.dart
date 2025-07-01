import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/device/device_utility.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AbAppBar({super.key,
   this.title, 
  this.showBackArrow = true, 
  this.leadingIcon,
  this.actions,
  this.leadingOnpressed});


  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnpressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AbSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
        ? IconButton(onPressed: (() => Get.back()), icon: Icon(Iconsax.arrow_left))
        : leadingIcon != null ? IconButton(onPressed: leadingOnpressed, icon: Icon(leadingIcon)) : null,
        title: title,
        actions: actions,
      ),
    );
  }
  
  @override
  
  Size get preferredSize => Size.fromHeight(AbDeviceUtils.getAppBarHeight());
}