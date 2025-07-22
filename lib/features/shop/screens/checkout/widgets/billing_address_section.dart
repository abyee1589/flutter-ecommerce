import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class ABBillingAddressSection extends StatelessWidget {
  const ABBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AbSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){}),
        const SizedBox(height: AbSizes.spaceBtwItems / 2),
        Text('Coding with Ab', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: AbSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: AbColors.grey, size: 16),
            const SizedBox(width: AbSizes.spaceBtwItems),
            Text('+251-915-948189', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: AbColors.grey, size: 16),
            const SizedBox(width: AbSizes.spaceBtwItems),
            Text('Anfo, Sheggar, Addis Ababa, Ethiopia', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
      ],
    );
  }
}