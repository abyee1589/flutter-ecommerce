import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/images/ab_circular_image.dart';
import 'package:flutter_app/utils/constants/colors.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class AbUserProfileTile extends StatelessWidget {
  const AbUserProfileTile({
    super.key, 
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AbCircularImage(
        width: 50,
        height: 50,
        padding: 0,
        image: AbImages.user
      ),
    
    title: Text('Coding with Ab', style: Theme.of(context).textTheme.headlineSmall!.apply(color: AbColors.white)),
    subtitle: Text('abdibekele2021@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: AbColors.white)),
    trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: AbColors.white,)),
    );
  }
}