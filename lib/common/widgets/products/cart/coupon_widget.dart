import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class AbCouponCode extends StatelessWidget {
  const AbCouponCode({
    super.key,
});


  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return AbRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? AbColors.dark : AbColors.white,
      padding: const EdgeInsets.only(bottom: AbSizes.sm, top: AbSizes.sm, left: AbSizes.sm, right: AbSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: ('Have a promo code? Enter here'),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none
              ),
            ),
          ),
    
          /// Button
          SizedBox(
            width: 80, 
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? AbColors.white.withOpacity(0.5) : AbColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.1),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}