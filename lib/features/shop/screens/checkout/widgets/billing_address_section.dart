import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/personalization/controllers/address_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ABBillingAddressSection extends StatelessWidget {
  const ABBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AbSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () => addressController.selectNewAddressPopup(context), showActionButton: true,),
        Obx(() {
          final selected = addressController.selectedAddress.value;
          if(selected.id.isNotEmpty){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(selected.name, style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: AbSizes.spaceBtwItems / 2),
                Row(
                  children: [
                    const Icon(Icons.phone, color: AbColors.grey, size: 16),
                    const SizedBox(width: AbSizes.spaceBtwItems),
                    Text(selected.phoneNumber, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: AbSizes.spaceBtwItems / 2),
                Row(
                  children: [
                    const Icon(Icons.location_history, color: AbColors.grey, size: 16),
                    const SizedBox(width: AbSizes.spaceBtwItems),
                    Text(selected.toString(), style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
                  ],
                ),
              ],
            );
          }
          else {
            return Text('Select Address', style: Theme.of(context).textTheme.bodyMedium);
          }
        }
      )
    ]);
        
  }
}
