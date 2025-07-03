import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/products/cart/cart_icon_menu.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';

class AbHomeAppBar extends StatelessWidget {
  const AbHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AbAppBar(
       title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AbTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: AbColors.grey)),
          Text(AbTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: AbColors.grey)),
        ]
      ),
      actions: [
        AbCartCounterIcon(onPressed: ((){}), iconColor: AbColors.white)
      ],
    );
  }
}

