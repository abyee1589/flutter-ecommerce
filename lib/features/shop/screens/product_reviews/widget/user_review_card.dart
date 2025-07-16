import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage:  AssetImage(AbImages.user)),
                const SizedBox(width: AbSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems),

        Row(
          children: [
            const AbRatingBarIndicator(rating: 4),
            const SizedBox(width: AbSizes.spaceBtwItems),
            Text('16 Jul, 2025', style: Theme.of(context).textTheme.bodySmall),    
        ]),

        const SizedBox( height: AbSizes.spaceBtwItems),
         const ReadMoreText(
          'The user interface is  quite intuitives. I was able to nagivaget and make progress seamlessy. great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show Less',
          trimCollapsedText: 'Show More',
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AbColors.primary),
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AbColors.primary)
        ),

        /// Company review
        AbRoundedContainer(
          backgroundColor: dark ? AbColors.darkerGrey : AbColors.grey,
          padding: const EdgeInsets.all(AbSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ab\'s Store', style: Theme.of(context).textTheme.titleMedium),
                  Text('16 July, 2025', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox( height: AbSizes.spaceBtwItems),
              const ReadMoreText(
                'The user interface is  quite intuitives. I was able to nagivaget and make progress seamlessy. great job!',
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimExpandedText: 'Show Less',
                trimCollapsedText: 'Show More',
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AbColors.primary),
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AbColors.primary)
              ),
            ],
          ),
        ),
        const SizedBox(height: AbSizes.spaceBtwSections),
      ],
    );
  }
}