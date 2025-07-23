import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AbAppBar(title: Text('Popular products'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(AbSizes.defaultSpace),
          child: AbSortableProducts(),
        ),
      ),
    );
  }
}

