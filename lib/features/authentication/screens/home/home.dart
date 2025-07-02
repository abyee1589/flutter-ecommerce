import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/authentication/screens/home/widgets/home_appbar.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AbPrimaryHeaderContainer(
              child: Column(
                children: [

                  /// Appbar
                  const AbHomeAppBar(), 
                  const SizedBox(height: AbSizes.spaceBtwSections),
                  
                  /// Searchbar
                  const AbSearchContainer(text: 'Search in Store', icon: Iconsax.search_normal),
                  const SizedBox(height: AbSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: const EdgeInsets.only(left: AbSizes.defaultSpace), 
                    child: Column(
                      children: [

                        /// Heading
                        const AbSectionHeading(title: 'Popular categories', showActionButton: false, textColor: AbColors.white),
                        const SizedBox(height: AbSizes.spaceBtwItems),

                        /// Categories
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6, 
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return AbVerticalImageText(image: AbImages.google, title: 'Shoes Category', onTap: (){},);
                            }),
                        )
                  ],),)
                ]
              ),
            )
          ],               
        ),
                
      ),
    );
  }
}

class AbVerticalImageText extends StatelessWidget {
  const AbVerticalImageText({
    super.key, required this.image, required this.title, this.textColor = AbColors.white, this.backgroundColor = AbColors.white, this.onTap,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsGeometry.only(right: AbSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(AbSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? AbColors.black : AbColors.white),
                borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover, color: AbColors.dark,),
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwItems / 2),
            /// Text
            SizedBox(
              width: 55,
              child: Text(title, 
                style: Theme.of(context).textTheme.labelMedium!.apply(color: AbColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


