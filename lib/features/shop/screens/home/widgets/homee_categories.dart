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
    final controller = CategoryController.instance;
    return Obx((){
      if(controller.isLoading.value) return const AbShimmerEffect(width: 55, height: 55, radius: 55);
      if(controller.featuredCategories.isEmpty) {
        return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: AbColors.white)));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
           itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            print(category);
            return AbVerticalImageText(
              image: category.image,
              title: category.name,
              // onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        )
      );
    });
  }
}

