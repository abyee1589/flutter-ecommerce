import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:flutter_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/popups/shimmer_loader.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const AbAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    /// Profile picture
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : AbImages.user;
                      return controller.imageUploading.value == true 
                        ? const AbShimmerEffect(width: 80, height: 80, radius: 80,)
                        : AbCircularImage(imageUrl: image, width: 80, height: 80, backgroundColor: AbColors.grey, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    const SizedBox(height: AbSizes.spaceBtwItems / 2),
                    TextButton(onPressed: () => controller.uploadProfilePicture(), child: const Text('Change Your Profile Picture')), 
                  ],
                ),
              ),


              /// Details
              const SizedBox(height: AbSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AbSizes.spaceBtwItems),

              /// Heading Profile Info
              const AbSectionHeading(title: 'Profile Information'),
              const SizedBox(height: AbSizes.spaceBtwItems),

              AbProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: (() => Get.to(() => const ChangeName()))),
              AbProfileMenu(title: 'username', value: controller.user.value.username, onPressed: (){}),

              const SizedBox(height: AbSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: AbSizes.spaceBtwItems),

              /// Heading Personal Info
              const AbSectionHeading(title: 'Personal Information'),
              const SizedBox(height: AbSizes.spaceBtwItems),

              AbProfileMenu(title: 'User 10', value: controller.user.value.id, icon: Iconsax.copy,onPressed: (){}),
              AbProfileMenu(title: 'Email', value: controller.user.value.email, onPressed: (){}),
              AbProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: (){}),
              AbProfileMenu(title: 'Gender', value: 'Male', onPressed: (){}),
              AbProfileMenu(title: 'Date of Birth', value: '15 May, 1991', onPressed: (){}),

              const Divider(),
              const SizedBox(height: AbSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(), 
                  child: const Text('Close Account', style: TextStyle(color: Colors.red))),
              )


            ],
          ),
        ),
      ),
    );
  }
}