import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/shop/screens/product_detail/product_detail_image_slider.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/bottom_add_to_cart_widget.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:flutter_app/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:flutter_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductdetailScreen extends StatelessWidget {
  const ProductdetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(

          /// Product Details
          children: [

            /// Product image slider
            const AbProductImageSlider(),

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
                  const AbProductMetaData(),

                  /// Attributes
                  const AbProductAttiributes(),
                  const SizedBox(height: AbSizes.spaceBtwSections),
                  
                  /// Checkout button
                  SizedBox(
                    width: double.infinity,
                    child:  ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                    const SizedBox(height: AbSizes.spaceBtwSections),

                  /// Description
                  const AbSectionHeading(title: 'Description'),
                  const SizedBox(height: AbSizes.spaceBtwItems,),
                  const ReadMoreText(
                    'Ive made the descriptions as detailed as possible, while also withholding as many details as possible. This may sound odd, but I ve done it by mostly describing how a character looks, rather than his or her personality. I have tried to make the character\'s looks and some vague personality traits dictate what kind of person he or she could be.',
                    trimLength: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'Show Less',
                    trimCollapsedText: 'Show More',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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

