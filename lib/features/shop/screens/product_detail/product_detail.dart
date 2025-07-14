import 'package:flutter/material.dart';
import 'package:flutter_app/features/shop/screens/product_detail/product_detail_image_slider.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class ProductdetailScreen extends StatelessWidget {
  const ProductdetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Product image slider
            AbProductImageSlider(),

            /// product details
            Padding(
              padding: EdgeInsetsGeometry.only(
                left: AbSizes.defaultSpace,
                bottom: AbSizes.defaultSpace,
                top: AbSizes.defaultSpace
              ),
              child: Column(
                children: [

                  /// Ratings and Share button
                  AbRatingAndShare(),

                  /// Price, Title, Stock and Brand
                  AbProductMetaData(),
                  /// Attributes
                  /// Checkout button
                  /// Description
                  /// Reviews
                ],
              ),
            )
            /// product details
            
          ],
        ),
      ),
    );
  }
}

