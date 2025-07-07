import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_app/common/widgets/products/cart/cart_icon_menu.dart';
import 'package:flutter_app/common/widgets/texts/ab_brand_title_text_with_verified_icon.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/enums.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
    this.child, 
    this.width, 
    this.height, 
    this.radius =AbSizes.borderRadiusLg, 
    this.showBorder = false,
    this.padding,
    this.margin,  
    this.backgroundColor = AbColors.white, 
    this.borderColor = AbColors.borderPrimary, 
    
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry?  margin;
  

  @override
  Widget build(BuildContext context) {
    final dark = AbHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AbAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          AbCartCounterIcon(onPressed: (){})
        ],
      ),
      body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: dark ? AbColors.black : AbColors.white,
             expandedHeight: 440,
             flexibleSpace: Padding(
              padding: const EdgeInsets.all(AbSizes.defaultSpace),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [

                  /// Search bar
                  const SizedBox(height: AbSizes.spaceBtwItems),
                  const AbSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                  const SizedBox(height: AbSizes.spaceBtwSections),

                  /// Feaured Brands
                  AbSectionHeading( title: 'Featured Brands', onPressed: (){},),
                  const SizedBox(height: AbSizes.spaceBtwItems / 1.5),

                  // const AbGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder(_, index){
                  //   return GestureDetector(
                  //     onTap: (){},
                  //     child: AbRoundedContainer(
                  //       padding: const EdgeInsets.all(AbSizes.sm),
                  //       showBorder: true,
                  //       backgroundColor: Colors.transparent,
                  //       child: Row(
                  //         children: [
                  //           ///
                  //           AbCircularImage(
                  //             isNetworkImage: false,
                  //             image: AbImages.clothIcon,
                  //             backgroundColor: Colors.transparent,
                  //             overlayColor: dark ? AbColors.white : AbColors.black,
                  //           ),
                  //           const SizedBox(width: AbSizes.spaceBtwItems / 2),
                      
                  //           /// Text
                  //           Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               const AbBrandTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large,),
                  //               Text('256 Products',
                  //                 overflow: TextOverflow.ellipsis,
                  //                 style: Theme.of(context).textTheme.labelMedium,
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  // );
                  // }
                  // )
                ],
              ),
              ),
          ),
        ];
      },
      body: Container(),
      ),
    );
  }
}

