import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
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
                  AbAppBar(
                     title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AbTexts.homeAppbarTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: AbColors.grey)),
                        Text(AbTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: AbColors.grey)),
                      ]
                    ),
                    actions: [
                      Stack(children: [
                        IconButton(onPressed: (() {}), icon: Icon(Iconsax.shopping_bag), color: AbColors.white),
                        Positioned(
                          right: 0,
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: AbColors.black,
                              borderRadius: BorderRadius.circular(100)
                            ),
                          ),
                        ),
                      ]
                      )
                    ],
                  ) 
                ]
              ),
            )
          ],               
        ),
                
      ),
    );
  }
}

