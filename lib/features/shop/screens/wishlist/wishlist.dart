import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/icon/ab_circular_icon.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_app/features/shop/controllers/product/favourites_controller.dart';
import 'package:flutter_app/features/shop/screens/home/home.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_app/utils/shimmers/vertical_product_shimmer.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: AbAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [AbCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(() => const HomeScreen()))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              future: controller.favouriteProducts(),
              builder: (context, snapshot) {
                final loader = const AbVerticalProductShimmer();
                final widget = AbCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);
                if(widget != null) return widget;
            
                final favouriteProducts = snapshot.data!;
                return AbGridLayout(
                    itemCount: favouriteProducts.length,
                    itemBuilder: (_, index) => AbProductCardVertical(product: favouriteProducts[index]),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
