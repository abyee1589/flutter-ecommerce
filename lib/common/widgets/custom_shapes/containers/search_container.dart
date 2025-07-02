import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/device/device_utility.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbSearchContainer extends StatelessWidget {
  const AbSearchContainer({
    super.key, required this.text, this.icon, this.showBackground = true, this.showBorder = true,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AbSizes.defaultSpace),
      child: Container(
        width: AbDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(AbSizes.md),
        decoration: BoxDecoration(
          color: showBackground ? dark ? AbColors.white : AbColors.light : Colors.transparent,
          borderRadius: BorderRadius.circular(AbSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: AbColors.grey) : null,
        ),
        child: Row(children: [
          Icon(icon, color: AbColors.darkGrey),
          const SizedBox(width: AbSizes.defaultSpace),
          Text(text, style: Theme.of(context).textTheme.bodySmall,)
        ],),
      ),
    );
  }
}

