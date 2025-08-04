import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/products/cart/cart_icon_menu.dart';
import 'package:flutter_app/features/shop/controllers/home_controller/user/user_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:flutter_app/utils/popups/shimmer_loader.dart';
import 'package:get/get.dart';

class AbHomeAppBar extends StatelessWidget {
  const AbHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return AbAppBar(
       title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AbTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: AbColors.grey)),
          Obx(() {
            if(controller.profileLoading.value){
              return const AbShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineMedium!.apply(color: AbColors.grey));
            }
          }
          ),
        ]
      ),
      actions: [
        AbCartCounterIcon(onPressed: ((){}), iconColor: AbColors.white)
      ],
    );
  }
}

