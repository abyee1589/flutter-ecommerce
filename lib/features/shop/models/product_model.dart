import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/features/shop/models/brand_model.dart';
import 'package:flutter_app/features/shop/models/product_attributes_model.dart';
import 'package:flutter_app/features/shop/models/product_variation_model.dart';

class ProductModel {
  String? id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  static ProductModel empty() => ProductModel(
    id: '',
    stock: 0,
    price: 0,
    title: '',
    thumbnail: '',
    productType: '',
  );

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  Map<String, dynamic> toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images,
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand?.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((attribute) => attribute.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((variation) => variation.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>?)
          ?.map((attributes) => ProductAttributeModel.fromJson(attributes))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>?)
          ?.map((variation) => ProductVariationModel.fromJson(variation))
          .toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(
    QueryDocumentSnapshot<Object> document,
  ) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((attributes) => ProductAttributeModel.fromJson(attributes))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((attributes) => ProductVariationModel.fromJson(attributes))
          .toList(),
    );
  }
}
