class AbPricingCalculator {
  /// Calculates the total price (product + tax + shipping)
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// Returns shipping cost only
  static double calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return double.parse(shippingCost.toStringAsFixed(2));
  }

  /// Returns tax amount only
  static double calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return double.parse(taxAmount.toStringAsFixed(2));
  }

  /// Stub method: Add logic for location-specific tax if needed
  static double getTaxRateForLocation(String location) {
    return 0.10; // 10% tax for all locations2
  }

  /// Stub method: Customize this for location-based shipping cost
  static double getShippingCost(String location) {
    return 5.00;
  }
}
