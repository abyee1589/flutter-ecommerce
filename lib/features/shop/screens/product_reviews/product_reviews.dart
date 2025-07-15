import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/device/device_utility.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AbAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Reviews and ratings are verified and they are from the people who use the same product that you use!'),
              const SizedBox(height: AbSizes.spaceBtwItems),

              /// Overall Product Ratings
              Column(children: [
                Row(
                  children: [
                    Text('4.8', style: Theme.of(context).textTheme.displayLarge),
                    Row(
                      children: [
                        Text('5', style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(
                          width: AbDeviceUtils.getScreenWidth(context) * 0.5,
                          child: LinearProgressIndicator(
                            value: 0.5,
                            minHeight: 25,
                            backgroundColor: AbColors.grey,
                            valueColor: const AlwaysStoppedAnimation(AbColors.primary),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        )
                      ],),
                  ],
                )
              ],)
            ],
          ),
          ),
      ),
    );
  }
}