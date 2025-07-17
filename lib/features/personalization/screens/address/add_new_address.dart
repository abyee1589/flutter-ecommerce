import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AbAppBar(showBackArrow: true, title: Text('Add New Addres')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user,), label: Text('Name')),
                ),
                const SizedBox(height: AbSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile,), label: Text('Phone Number')),
                ),
                const SizedBox(height: AbSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31,), label: Text('Street')))),
                    const SizedBox(width: AbSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code,), label: Text('Postal Code')))),
                  ],
                ),
                const SizedBox(height: AbSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building,), label: Text('City')))),
                    const SizedBox(width: AbSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity,), label: Text('State')))),
                  ],
                ),
                const SizedBox(height: AbSizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building,), label: Text('Country'))),
                const SizedBox(height: AbSizes.spaceBtwInputFields * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}