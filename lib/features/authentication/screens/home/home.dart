import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/authentication/screens/home/home_categories.dart/homee_categories.dart';
import 'package:flutter_app/features/authentication/screens/home/widgets/home_appbar.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AbPrimaryHeaderContainer(
              child: Column(
                children: [

                  /// Appbar
                  AbHomeAppBar(), 
                  SizedBox(height: AbSizes.spaceBtwSections),
                  
                  /// Searchbar
                  AbSearchContainer(text: 'Search in Store', icon: Iconsax.search_normal),
                  SizedBox(height: AbSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: AbSizes.defaultSpace), 
                    child: Column(
                      children: [

                        /// Heading
                        AbSectionHeading(title: 'Popular categories', showActionButton: false, textColor: AbColors.white),
                        SizedBox(height: AbSizes.spaceBtwItems),

                        /// Categories
                        HomeCategories()
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


