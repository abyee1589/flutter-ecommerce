import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/features/shop/controllers/product/order_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbOrderListItems extends StatelessWidget {
  const AbOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    final orderController = Get.put(OrderController());
    return FutureBuilder(
      future: orderController.fetchUserOrders(),
      builder: (_, snapshot) {
        final response = AbCloudHelperFunctions.checkMultipleRecordState(
          snapshot: snapshot,
        );
        if (response != null) return response;
        final orders = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, _) =>
              const SizedBox(height: AbSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = orders[index];
            return AbRoundedContainer(
              padding: const EdgeInsets.all(AbSizes.md),
              showBorder: true,
              backgroundColor: dark ? AbColors.dark : AbColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Row 1
                  Row(
                    children: [
                      /// Icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: AbSizes.spaceBtwItems / 2),

                      /// Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .apply(
                                    color: AbColors.primary,
                                    fontWeightDelta: 1,
                                  ),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: AbSizes.iconSm,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AbSizes.spaceBtwItems),

                  /// Row 2
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            /// Icon
                            const Icon(Iconsax.tag),
                            const SizedBox(width: AbSizes.spaceBtwItems / 2),

                            /// Status & Date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.id,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            /// Icon
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: AbSizes.spaceBtwItems / 2),

                            /// Status & Date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipping Date',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.formattedDeliveryDate,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
