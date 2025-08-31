import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String brandId;
  final String productId;

  ProductCategoryModel({required this.brandId, required this.productId});

  Map<String, dynamic> toJson() {
    return {'brandId': brandId, 'productId': productId};
  }

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductCategoryModel(
      brandId: data['brandId'] as String,
      productId: data['productId'] as String,
    );
  }
}
