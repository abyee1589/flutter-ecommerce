import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AbAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              const AbCartItems(showActionButtons: false,),
              const SizedBox(height: AbSizes.spaceBtwItems),

              /// Coupon Text Field
              AbRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? AbColors.dark : AbColors.white,
                padding: const EdgeInsets.only(bottom: AbSizes.sm, top: AbSizes.sm, left: AbSizes.sm, right: AbSizes.sm),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: ('Move a promo code? Enter here')
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}