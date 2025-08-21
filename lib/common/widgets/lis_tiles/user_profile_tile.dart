import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AbUserProfileTile extends StatelessWidget {
  const AbUserProfileTile({
    super.key, 
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
                final networkImage = controller.user.value.profilePicture;
                final image = networkImage.isNotEmpty ? networkImage : AbImages.user;
                return AbCircularImage(imageUrl: image, width: 50, height: 50, padding: 0, fit: BoxFit.contain, backgroundColor: AbColors.grey, isNetworkImage: networkImage.isNotEmpty);
              }),
    title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: AbColors.white)),
    subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: AbColors.white)),
    trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: AbColors.white,)),
    );
  }
}