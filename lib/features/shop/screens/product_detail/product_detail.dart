import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/features/shop/screens/product_detail/product_detail_image_slider.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/bottom_add_to_cart_widget.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:flutter_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductdetailScreen extends StatelessWidget {
  const ProductdetailScreen({
    super.key,
    required this.product,
    });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(

          /// Product Details
          children: [

            /// Product image slider
            AbProductImageSlider(product: product),

            /// product details
            Padding(
              padding: const EdgeInsetsGeometry.only(
                left: AbSizes.defaultSpace,
                bottom: AbSizes.defaultSpace,
                top: AbSizes.defaultSpace
              ),
              child: Column(
                children: [

                  /// Ratings and Share button
                  const AbRatingAndShare(),

                  /// Price, Title, Stock and Brand
                  AbProductMetaData(product: product),

                  /// Attributes
                  if(product.productType == ProductType.variable.toString())  AbProductAttiributes(product: product),
                    
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: AbSizes.spaceBtwSections),
                      
                  /// Checkout button
                  SizedBox(
                    width: double.infinity,
                    child:  ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                    const SizedBox(height: AbSizes.spaceBtwSections),

                  /// Description
                  const AbSectionHeading(title: 'Description'),
                  const SizedBox(height: AbSizes.spaceBtwItems,),
                  ReadMoreText(
                    product.description ?? '',
                    trimLength: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'Show Less',
                    trimCollapsedText: 'Show More',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: AbSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AbSectionHeading(title: 'Reviews(199)'),
                      IconButton(
                        onPressed: () => Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: AbSizes.spaceBtwSections),
                ],
              ),
            )   
          ],
        ),
      ),
    );
  }
}

