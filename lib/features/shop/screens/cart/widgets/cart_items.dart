import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/products/cart/cart_item.dart';
import 'package:flutter_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_app/features/shop/screens/cart/add_remove_button.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class AbCartItems extends StatelessWidget {
  const AbCartItems({
    super.key, 
    this.showActionButtons = true,
  });
  final bool showActionButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, _) => const SizedBox(height: AbSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
    
          /// Cart Item
          const AbCartItem(),
          if(showActionButtons) const SizedBox(height: AbSizes.spaceBtwItems),
    
          /// Add Remove Button Row with Item Price
          if(showActionButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
      
                    /// Extra space
                    SizedBox(width: 70),
      
                    /// Add Remove Buttons
                    AbProductQuantityWithAddRemoveButton(),
                  ],
                ),
      
                /// Product total price
                AbProductPriceText(price: '256')
              ],
            ),
        ],
      ), 
    );
  }
}

