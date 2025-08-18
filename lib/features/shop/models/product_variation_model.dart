

class ProductVariationModel {
  final String id;
  int stock;
  String sku;
  double price;
  double salePrice;
  String? description;
  String image;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.stock = 0,
    this.sku = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.image = '',
    required this.attributeValues,
    this.description,
  });

  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

    Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttriuteValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if(data.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '', 
      price: double.parse((data['Price'] ?? 0.0).toString()),
      sku: data['SKU'] ?? '', 
      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      image: data['Image'] ?? '', 
      attributeValues: Map<String, String>.from(data['AttriuteValues']),
    );
  }
}