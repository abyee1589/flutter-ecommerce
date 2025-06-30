import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/screens/paswword_configuration/reset_password.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key, required this.image, required this.title, required this.subTitle});
  final String title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (() => Get.back()), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AbSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title and Subtitle
            Text(AbTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center),
            SizedBox(height: AbSizes.spaceBtwItems),
            Text(AbTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            SizedBox(height: AbSizes.spaceBtwSections * 2),

            /// Text fields
            TextFormField(
              decoration: InputDecoration(
                labelText: AbTexts.email, prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: AbSizes.spaceBtwSections),

            /// Submit button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (() => Get.off(() => ResetPassword())), child: Text(AbTexts.submit))),

          ],
        )),
    );
  }
}