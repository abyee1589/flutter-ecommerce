import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';

class AbLoginHeader extends StatelessWidget {
  const AbLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? AbImages.lightAppLogo : AbImages.darkAppLogo),
        ),
        Text(AbTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AbSizes.sm),
        Text(AbTexts.loginSubTile, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}