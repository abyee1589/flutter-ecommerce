import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/features/personalization/controllers/address_controller.dart';
import 'package:flutter_app/features/personalization/models/addres_model.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class AbSingleAddress extends StatelessWidget {
  const AbSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    return Obx(() {
      final isSelected = controller.selectedAddress.value.id == address.id;

      return InkWell(
        onTap: onTap,
        child: AbRoundedContainer(
          padding: const EdgeInsets.all(AbSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: isSelected
              ? AbColors.primary.withOpacity(0.8)
              : Colors.transparent,
          borderColor: isSelected
              ? Colors.transparent
              : dark
                  ? AbColors.darkerGrey
                  : AbColors.grey,
          margin: const EdgeInsets.only(bottom: AbSizes.spaceBtwItems),
          child: Stack(
            children: [
              if (isSelected)
                const Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    Iconsax.tick_circle,
                    color: AbColors.light,
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AbSizes.sm / 2),
                  Text(
                    address.phoneNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    address.toString(),
                    softWrap: true,
                  ),
                  const SizedBox(height: AbSizes.sm / 2),
                ],
              ),
            ],
          ),
        ),
      );
    });
}
}
