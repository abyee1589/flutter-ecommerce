import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/features/personalization/controllers/address_controller.dart';
import 'package:flutter_app/features/personalization/screens/address/add_new_address.dart';
import 'package:flutter_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: AbColors.primary,
        child: const Icon(Iconsax.add, color: AbColors.white),
      ),
      appBar: AbAppBar(
        showBackArrow: true,
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AbSizes.defaultSpace),
        child: Obx(
          () => FutureBuilder(
            key: Key(controller.refreshData.value.toString()),
            future: controller.getAllUserAddresses(),
            builder: (context, snapshot) {
              final widget = AbCloudHelperFunctions.checkMultipleRecordState(
                snapshot: snapshot,
              );
              if (widget != null) return widget;
          
              final addresses = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: addresses.length,
          
                itemBuilder: (_, index) => AbSingleAddress(address: addresses[index], onTap: () => controller.selectAddress(addresses[index])),
              );
            },
          ),
        ),
      ),
    );
  }
}
