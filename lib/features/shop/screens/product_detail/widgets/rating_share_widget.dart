import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AbRatingAndShare extends StatelessWidget {
  const AbRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: AbSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(199)'),
                  ]
              ),
            ),
          ],
        ),
        /// Share button
        IconButton(onPressed: (){}, icon: const Icon(Icons.share, size: AbSizes.iconMd,))
      ],
    );
  }
}

