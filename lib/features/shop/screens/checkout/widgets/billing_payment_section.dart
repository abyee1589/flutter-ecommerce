import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbBillingPaymentSection extends StatelessWidget {
  const AbBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        AbSectionHeading(
          title: 'Payment Methods', 
          buttonTitle: 'Change', 
          showActionButton: true,
          onPressed: (){},
        ),
        const SizedBox(height: AbSizes.spaceBtwItems / 2),
        Row(
          children: [
            AbRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? AbColors.light : AbColors.white,
              padding: const EdgeInsets.all(AbSizes.sm),
              child: const Image(image: AssetImage(AbImages.paypal), fit: BoxFit.contain,),
            ),
            const SizedBox(width: AbSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,)

        ],)
      ],
    );
  }
}