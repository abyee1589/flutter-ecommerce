import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: AbAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AbSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              return const AbSortableProducts();
            },
          ),
        ),
      ),
    );
  }
}
