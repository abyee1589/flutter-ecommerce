import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_app/features/shop/controllers/home_controller/category_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/popups/shimmer_loader.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const AbShimmerEffect(width: 55, height: 55, radius: 55);
        }

        if (controller.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              'No categories found!',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: AbColors.white,
              ),
            ),
          );
        }

        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];

              // Determine if the image is a network image or a local asset.
              final isNetworkImage = category.image.isNotEmpty;

              return AbVerticalImageText(
                // Use the category image if it exists, otherwise use the placeholder.
                image: category.image.trim() ,
                title: category.name,
                // Pass the correct flag to the widget.
                // isNetworkImage: isNetworkImage,
                // onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            
            }),
        );
      });
  }
}
