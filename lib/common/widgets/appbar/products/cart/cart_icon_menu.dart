import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class AbCartCounterIcon extends StatelessWidget {
  const AbCartCounterIcon({
    super.key, this.iconColor, required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(onPressed: (() {}), icon: Icon(Iconsax.shopping_bag), color: AbColors.white),
      Positioned(
        right: 0,
        child: Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            color: AbColors.black,
            borderRadius: BorderRadius.circular(100)
          ),
          child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color:AbColors.white, fontSizeFactor: 0.8)),
        ),
      ),
    ]
    );
  }
}

