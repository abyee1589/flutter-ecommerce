import 'package:flutter_app/features/shop/controllers/product/images_controller.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  void onAttributesSeleceted(
    ProductModel product,
    attributeName,
    attributeValue,
  ) {
    final selectedAttributes = Map<String, dynamic>.from(
      this.selectedAttributes,
    );
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          isSameAttributesValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.attributeValues.isNotEmpty) {
      final controller = Get.put(ImagesController());
      controller.selectedProductImage.value = selectedVariation.image;
    }

    this.selectedVariation.value = selectedVariation;

    getVariationStockStatus();
  }

  bool isSameAttributesValues(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {
    final availableVariationAttributeValues = variations
        .where(
          (variation) =>
              variation.attributeValues[attributeName] != null &&
              variation.attributeValues[attributeName]!.isNotEmpty &&
              variation.stock > 0,
        )
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  void getVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0
        ? 'In Stock'
        : 'Out of Stock';
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
