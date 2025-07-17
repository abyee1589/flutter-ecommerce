import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/features/personalization/screens/address/add_new_address.dart';
import 'package:flutter_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UseraddressScreen extends StatelessWidget {
  const UseraddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: AbColors.primary,
        child: const Icon(Iconsax.add, color: AbColors.white,),
        ),
        appBar: AbAppBar(
          showBackArrow: true,
          title: Text('Address', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              AbSingleAddress(selectedAddress: true),
              AbSingleAddress(selectedAddress: false)
            ],
          ),
        ),
      
    );
  }
}