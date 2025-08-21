import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/features/shop/controllers/banner_controller.dart';
import 'package:flutter_app/features/shop/controllers/category_controller.dart';
import 'package:flutter_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    final bannerController = BannerController.instance;
    final productController = ProductController.instance;
    return Scaffold(
      appBar: AbAppBar(title: Text('Upload Data', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Main Record', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AbSizes.spaceBtwItems),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AbSizes.defaultSpace),
                child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.category, color: AbColors.primary),
                            const SizedBox(width: AbSizes.spaceBtwItems),
                            Text('Upload Categories', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      IconButton(icon: const Icon(Iconsax.document_upload), color: AbColors.primary, onPressed: () => categoryController.uploadCategory()),
                    ]),
                  const SizedBox(height: AbSizes.spaceBtwItems * 2),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.tag, color: AbColors.primary),
                            const SizedBox(width: AbSizes.spaceBtwItems),
                            Text('Upload Brands', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      IconButton(icon: const Icon(Iconsax.document_upload), color: AbColors.primary, onPressed: (){}),
                    ]),
                  const SizedBox(height: AbSizes.spaceBtwItems * 2),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.shopping_bag, color: AbColors.primary),
                            const SizedBox(width: AbSizes.spaceBtwItems),
                            Text('Upload Products', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      IconButton(icon: const Icon(Iconsax.document_upload), color: AbColors.primary, onPressed: () => productController.uploadAllProducts()),
                    ]),
                  const SizedBox(height: AbSizes.spaceBtwItems * 2),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.gallery, color: AbColors.primary),
                            const SizedBox(width: AbSizes.spaceBtwItems),
                            Text('Upload Banners', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      IconButton(icon: const Icon(Iconsax.document_upload), color: AbColors.primary, onPressed: () => bannerController.uploadBanners()),
                    ]),
                ],
                ),
              ),  
              Text('Relationships', style: Theme.of(context).textTheme.titleLarge),
              Text('Relationships', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: AbSizes.spaceBtwItems),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AbSizes.defaultSpace),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Iconsax.hierarchy, color: AbColors.primary),
                              const SizedBox(width: AbSizes.spaceBtwItems),
                              Text('Upload Categories', style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                        IconButton(icon: const Icon(Iconsax.document_upload), color: AbColors.primary, onPressed: (){}),
                      ]),
                    const SizedBox(height: AbSizes.spaceBtwItems * 2),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Iconsax.hierarchy, color: AbColors.primary),
                              const SizedBox(width: AbSizes.spaceBtwItems),
                              Text('Upload Categories', style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                        IconButton(icon: const Icon(Iconsax.document_upload), color: AbColors.primary, onPressed: (){}),
                      ]),
                  ]
                )
              )
          ]),
        ),
      ),
    );
  }
}