import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_app/features/shop/screens/home/home.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AbAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          AbCircularIcon( 
            icon: Iconsax.add, 
            onPressed: () => Get.to(() => const HomeScreen())
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              AbGridLayout(itemCount: 6, itemBuilder: (_, index) => const AbProductCardVertical())
            
          ],),
          ),
      ),
    );
  }
}