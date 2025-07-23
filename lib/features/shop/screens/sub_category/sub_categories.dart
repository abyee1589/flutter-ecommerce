import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/images/ab_rounded_image.dart';
import 'package:flutter_app/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AbAppBar(title: Text('Sports Shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [

              /// Banner
              const AbRoundedImage(
                width: double.infinity,
                imageUrl: AbImages.promoBanner1,
                applyImageRadius: true,
              ),
              const SizedBox(height: AbSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  AbSectionHeading(title: 'Sports Shirt', onPressed: (){}, showActionButton: true,),
                  const SizedBox(height: AbSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: AbSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const AbProductCardHorizontal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}