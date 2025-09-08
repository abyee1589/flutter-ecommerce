import 'package:flutter/material.dart';
import 'package:flutter_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/pricing_calculator.dart';

class AbBillingAmountSection extends StatelessWidget {
  const AbBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shippng Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '\$${AbPricingCalculator.calculateShippingCost(subTotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems / 2),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${AbPricingCalculator.calculateTax(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: AbSizes.spaceBtwItems / 2),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.titleMedium),
            Text('\$${AbPricingCalculator.calculateTotalPrice(subTotal, 'US')}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
