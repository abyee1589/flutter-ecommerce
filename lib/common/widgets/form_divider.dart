import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbFormDivider extends StatelessWidget {
  const AbFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child:Divider(color: dark ? AbColors.darkGrey : AbColors.grey, thickness: 0.5,indent: 60,endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.bodyMedium), 
        Flexible(child:Divider(color: dark ? AbColors.darkGrey : AbColors.grey, thickness: 0.5,indent: 5,endIndent: 60)), 
      ],
    );
  }
}