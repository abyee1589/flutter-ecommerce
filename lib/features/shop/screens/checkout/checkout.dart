import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/products/cart/coupon_widget.dart';
import 'package:flutter_app/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:flutter_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:flutter_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutter_app/navigation_menu.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

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

              ///Items in Cart
              const AbCartItems(showActionButtons: false,),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Coupon Text Field
              const AbCouponCode(),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Billing Section
              AbRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(AbSizes.md),
                backgroundColor: dark ? AbColors.black : AbColors.white,
                child: const Column(
                  children: [

                    ///Pricing
                    AbBillingAmountSection(),
                    SizedBox(height: AbSizes.spaceBtwItems),

                    ///Divider
                    Divider(),
                    SizedBox(height: AbSizes.spaceBtwItems),
                    
                    ///Payment Methods
                    AbBillingPaymentSection(),
                    SizedBox(height: AbSizes.spaceBtwItems),

                    ///Address
                    ABBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      
       /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AbSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
            image: AbImages.success,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
           )), 
          child: const Text('Pay \$256.0')),
      ),
    );
  }
}

