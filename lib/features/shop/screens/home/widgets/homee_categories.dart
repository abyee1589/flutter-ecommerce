import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';


class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = CategoryController.instance;
    // return 
      // if(controller.isLoading.value) return const AbShimmerEffect(width: 55, height: 55, radius: 55);
      // if(controller.featuredCategories.isEmpty) {
      //   return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: AbColors.white)));
      // }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          // controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
           itemBuilder: (_, index) {
            // final category = controller.featuredCategories[index];
            return const AbVerticalImageText(
              image: AbImages.clothIcon,
              title: 'T-shirt',
              // onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        )
      );
    // });
  }
}

