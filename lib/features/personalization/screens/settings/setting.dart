import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_app/common/widgets/lis_tiles/settings_menu_tile.dart';
import 'package:flutter_app/common/widgets/lis_tiles/user_profile_tile.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/features/personalization/screens/address/address.dart';
import 'package:flutter_app/features/personalization/screens/profile/widgets/profile.dart';
import 'package:flutter_app/features/shop/screens/cart/cart.dart';
import 'package:flutter_app/features/shop/screens/order/order.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// Header
          AbPrimaryHeaderContainer(
            child: Column(
              children: [
                /// Appbar
                AbAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: AbColors.white))),
                const SizedBox(height: AbSizes.spaceBtwSections),
            
                /// User profile card
                AbUserProfileTile(onPressed: () => Get.to(() => const Profilescreen())),
                const SizedBox(height: AbSizes.spaceBtwSections),
              ],
            ),
          ),


          /// Body
          Padding(
            padding: const EdgeInsets.all(AbSizes.defaultSpace),
            child: Column(
              children: [
                /// Account Settings
                const AbSectionHeading(title: 'Account Settings'),
                const SizedBox(height: AbSizes.spaceBtwItems),
                AbSettingsMenuTile(
                  icon: Iconsax.safe_home, 
                  title : 'My Address', 
                  subTitle: 'Set shopping delivery address', 
                  onTap: () => Get.to(() => const UseraddressScreen()),
                ),
                AbSettingsMenuTile(
                  icon: Iconsax.shopping_cart, 
                  title : 'My Cart', 
                  subTitle: 'Add, remove products and more to checkout', 
                  onTap: () => Get.to(() => const CartScreen()),
                ),
                AbSettingsMenuTile(
                  icon: Iconsax.bag_tick, 
                  title : 'My Orders', 
                  subTitle: 'In-progress and completed orders', 
                  onTap: () => Get.to(() => const Orderscreen()),
                ),
                AbSettingsMenuTile(
                  icon: Iconsax.bank, 
                  title : 'Bank Account', 
                  subTitle: 'Withdraw balance to registered bank account', 
                  onTap: (){},
                ),
                AbSettingsMenuTile(
                  icon: Iconsax.discount_shape, 
                  title : 'My Coupons', 
                  subTitle: 'List of all the discounted cupons', 
                  onTap: (){},
                ),
                AbSettingsMenuTile(
                  icon: Iconsax.notification, 
                  title : 'Notifications', 
                  subTitle: 'Set any kind of notification message', 
                  onTap: (){},
                ),
                AbSettingsMenuTile(
                  icon: Iconsax.security_card, 
                  title : 'Account privacy', 
                  subTitle: 'Manage data usage and connected accounts', 
                  onTap: (){},
                ),


                /// App Settings
                const SizedBox(height: AbSizes.spaceBtwSections),
                const AbSectionHeading(title: 'App Settings'),
                const SizedBox(height: AbSizes.spaceBtwSections),
                AbSettingsMenuTile(
                  icon: Iconsax.document_upload, 
                  title : 'Load Data', 
                  subTitle: 'Upload Data to Your Cloud Firebase', 
                  onTap: (){},
                ),
                AbSettingsMenuTile(
                  icon: Iconsax.location, 
                  title : 'Geolocation', 
                  subTitle: 'Set recommendation based on location', 
                  trailing: Switch(value: true, onChanged: (value){}),
                ),
                AbSettingsMenuTile(
                  icon: Iconsax.security_user, 
                  title : 'Safe Mode', 
                  subTitle: 'Search result is safe for all ages', 
                  trailing: Switch(value: false, onChanged: (value){}),
                ),
                AbSettingsMenuTile(
                  icon: Iconsax.image, 
                  title : 'HD Image Quality', 
                  subTitle: 'Set image quality to be seen', 
                  trailing: Switch(value: false, onChanged: (value){}),
                ),

                /// Logout Button
                const SizedBox(height: AbSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: (){}, child: const Text('Logout')),
                ),
                const SizedBox(height: AbSizes.spaceBtwSections * 2.5)
              ],
            ),
          )
        ],),
    );
  }
}

